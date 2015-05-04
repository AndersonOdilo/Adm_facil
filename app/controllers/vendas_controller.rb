class VendasController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_venda, only: [:show, :edit, :update, :destroy]

  def add_item
    item_pedido = ItemPedido.new
    produto = Produto.find(params[:produto])
    if produto.quantidade_estoque >= params[:quantidade].to_i
      item_pedido.produto_id = produto.id
      item_pedido.preco = produto.valor_venda
      item_pedido.quantidade = params[:quantidade]
      session[:sub_total_venda] = session[:sub_total_venda].to_f + item_pedido.preco_total
      render locals: {item_pedido: item_pedido, sub_total: session[:sub_total_venda].to_f }
    else
        render 'erro', locals: {msg: 'Nao a estoque suficiente.'}
    end
  end

  def remover_item
    produto = Produto.find(params[:produto])
    session[:sub_total_venda] = session[:sub_total_venda].to_f - produto.valor_venda * params[:quantidade].to_f
      render json: number_to_currency(session[:sub_total_venda].to_f, unit: 'R$', separator: ",", delimiter: ".").to_json
  end

  def calcular_parcela
    valor_parcela = (session[:sub_total_venda].to_f  - params[:entrada].to_f) / params[:numero_parcelas].to_i
    valor_parcela.round(2)
      render json: number_to_currency(valor_parcela, unit: 'R$', separator: ",", delimiter: ".").to_json
  end

  def calcular_desconto
    desconto = session[:sub_total_venda].to_f - (session[:sub_total_venda].to_f * params[:desconto].to_f / 100)
    render json: number_to_currency(desconto, unit: 'R$', separator: ",", delimiter: ".").to_json
  end

  def finalizar
      if session[:sub_total_venda].to_f > 0
        if params[:cliente] != ""
          if params[:forma_pagamento].to_i == 5
            if Cliente.find(params[:cliente]).limite_credito >= session[:sub_total_venda].to_f
              render 'pagamento', locals: {entrega: params[:entrega]}
            else
              render 'erro', locals: {msg: 'Nao limite' }
            end
          else
            render 'finalizar', locals: {entrega: params[:entrega]}
          end
        else
          render 'erro', locals: {msg: 'Busque ou cadastre um cliente' }
        end
      else
        render 'erro', locals: {msg: 'Adicione produtos ao pedido.'}
      end
  end

  # GET /vendas
  # GET /vendas.json
  def index
    if params[:cliente]
      @vendas = Venda.includes(pedido: [cliente: [funcao:[:pessoa]]]).cliente(params[:cliente]).paginate(page: params[:page], per_page: 10).order("vendas.created_at desc")
    else
      @vendas = Venda.includes(pedido: [cliente: [funcao:[:pessoa]]]).paginate(page: params[:page], per_page: 10).order("vendas.created_at desc")
    end
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
    session[:sub_total_venda] = nil
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = Venda.new(venda_params)
    @venda.gerar_duplicatas(params[:valor_entrada].to_f, params[:numero_parcela].to_i, params[:intervalo_parcela].to_i)
    respond_to do |format|
      if @venda.save!
        format.html { redirect_to @venda}
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
