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
  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show
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
      if @venda.save
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
      @venda = Venda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venda_params
      params.require(:venda).permit(:forma_pagamento_id, :cliente_id, :desconto, :obs, :funcionario_id,
        pedido_attributes: [:id, :_destroy, itens_pedidos_attributes: [:id, :produto_id, :quantidade, :preco]])
    end
end
