class VendasController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_venda, only: [:show, :edit, :update, :destroy]

  def add_item
    item_pedido = ItemPedido.new
    produto = Produto.find(params[:produto])
    item_pedido.produto_id = produto.id
    item_pedido.preco = produto.valor_venda
    item_pedido.quantidade = params[:quantidade]
    sub_total = session[:sub_total]
    session[:sub_total] = sub_total.to_f + item_pedido.quantidade * item_pedido.preco
    respond_to do |format|
      format.js { render locals: {item_pedido: item_pedido, sub_total: session[:sub_total] }}
    end
  end

  def remover_item
    produto = Produto.find(params[:produto])
    session[:sub_total] = session[:sub_total].to_f - produto.valor_venda * params[:quantidade].to_f
    respond_to do |format|
      format.json {render json: (number_to_currency(session[:sub_total].to_f, unit: 'R$', separator: ",", delimiter: ".")).to_json }
    end
  end

  def calcular_parcela
    valor_parcela = (session[:sub_total].to_f  - params[:entrada].to_f) / params[:numero_parcelas].to_i
    valor_parcela.round(2)
    respond_to do |format|
      format.json {render json: (number_to_currency(valor_parcela, unit: 'R$', separator: ",", delimiter: ".")).to_json}
    end
  end

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = Venda.includes(pedido: [cliente: [funcao:[:pessoa]]]).all
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf {render pdf: 'Venda'}
    end
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
    session[:sub_total] = nil
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save!
        if @venda.desconto
          total = @venda.desconto
        else
          total = @venda.total
        end
        if @venda.forma_pagamento.id == 5
          if params[:valor_entrada] != ""
            pagamento = PagamentoVenda.new
            pagamento.data_vencimento = Date.today
            pagamento.data_pagamento = Date.today
            pagamento.valor = params[:valor_entrada].to_f
            pagamento.venda_id = @venda.id
            pagamento.save
            total = total - params[:valor_entrada].to_f
          end
          data = Date.today
          valor_parcela =  total  / params[:numero_parcela].to_i
          for i in 1..params[:numero_parcela].to_i
            pagamento = PagamentoVenda.new
            pagamento.data_vencimento = data + params[:intervalo_parcela].to_i.day
            data = data + params[:intervalo_parcela].to_i.day
            pagamento.venda_id = @venda.id
            pagamento.valor = valor_parcela
            pagamento.save
          end
        else
            pagamento = PagamentoVenda.new
            pagamento.data_vencimento = Date.today
            pagamento.data_pagamento = Date.today
            pagamento.valor = total
            pagamento.venda_id = @venda.id
            pagamento.save
        end
        format.html { redirect_to @venda, notice: 'Venda was successfully created.' }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: 'Venda was successfully updated.' }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to vendas_url, notice: 'Venda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.includes(:pagamentos_vendas, pedido: [:itens_pedidos, cliente: [funcao: [:pessoa]], funcionario:[funcao: [:pessoa]]]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venda_params
      params.require(:venda).permit(:forma_pagamento_id, :cliente_id, :desconto, :obs, :funcionario_id, :data,
        pedido_attributes: [:id, :_destroy, itens_pedidos_attributes: [:id, :produto_id, :quantidade, :preco]])
    end
end
