class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  def add_item
    produto = Produto.find(params[:produto])
    if produto.quantidade_estoque >= params[:quantidade].to_i
      item_pedido = ItemPedido.new(produto_id: produto.id, preco: produto.valor_venda, quantidade: params[:quantidade])
      session[:sub_total_venda] = session[:sub_total_venda].to_f + item_pedido.preco_total
      render locals: {item_pedido: item_pedido, sub_total: session[:sub_total_venda].to_f }
    else
        render 'erro', locals: {msg: 'Não a estoque suficiente.'}
    end
  end

  def remover_item
    produto = Produto.find(params[:produto])
    session[:sub_total_venda] = session[:sub_total_venda].to_f - produto.valor_venda * params[:quantidade].to_f
    render json: session[:sub_total_venda].to_f.to_json
  end

  def calcular_parcela
    valor_parcela = ((session[:sub_total_venda].to_f  - params[:entrada].to_f) / params[:numero_parcelas].to_i).round(2)
    render json: valor_parcela.to_json
  end

  def calcular_desconto
    desconto = session[:sub_total_venda].to_f - (session[:sub_total_venda].to_f * params[:desconto].to_f / 100)
    render json: desconto.to_json
  end

  def finalizar
    if session[:sub_total_venda].to_f > 0 
      if params[:forma_pagamento].to_i == 2
        if Cliente.find(params[:cliente]).limite_disponivel >= session[:sub_total_venda].to_f 
          render 'pagamento', locals: {entrega: params[:entrega], cliente: params[:cliente]}
        else
          render 'erro', locals: {msg: 'Não a limite' }
        end
      elsif params[:entrega].to_i == 2
        render 'endereco_entrega', locals: {cliente: params[:cliente]}
      else
        render 'finalizar', locals: {entrega: params[:entrega]}
      end
    else
      render 'erro', locals: {msg: 'Adicione itens ao pedido' }
    end
  end

  # GET /pedidos
  # GET /pedidos.json
  def index
    if params[:cliente]
      @pedido = Pedido.includes(cliente: [:pessoa]).cliente(params[:cliente]).order("pedidos.created_at desc")
    elsif params[:funcionario]
      @pedido = Pedido.includes(cliente: [:pessoa]).funcionario(params[:funcionario]).order("pedidos.created_at desc")
    else
      @pedido = Pedido.includes(cliente: [:pessoa]).order("pedidos.created_at desc")
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf {render pdf: 'Pedido'}
    end
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    session[:sub_total_venda] = nil
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.gerar_duplicatas(params[:valor_entrada].to_f, params[:numero_parcela].to_i, params[:intervalo_parcela].to_i)
    respond_to do |format|
      if @pedido.save
        flash[:notice] = "Pedido salvo com sucesso"
        format.html { redirect_to @pedido}
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido alterado com sucesso' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido excluido com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.includes(:pagamentos_vendas, :itens_pedidos, cliente: [:pessoa], funcionario:[:pessoa]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:forma_pagamento_id, :cliente_id, :desconto, :obs, :funcionario_id, :data,
        itens_pedidos_attributes: [:id, :produto_id, :quantidade, :preco])
    end
end
