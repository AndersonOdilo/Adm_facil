class OrcamentosController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

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

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    @orcamentos = Orcamento.all
  end

  # GET /orcamentos/1
  # GET /orcamentos/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf {render pdf: 'Orcamento'}
    end
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
    @orcamento.itens_pedidos.build
    session[:sub_total] = nil
  end

  # GET /orcamentos/1/edit
  def edit
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    @orcamento = Orcamento.new(orcamento_params)
    respond_to do |format|
      if @orcamento.save
        format.html { redirect_to @orcamento, notice: 'Orcamento was successfully created.' }
        format.json { render :show, status: :created, location: @orcamento }
      else
        format.html { render :new }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orcamentos/1
  # PATCH/PUT /orcamentos/1.json
  def update
    respond_to do |format|
      if @orcamento.update(orcamento_params)
        format.html { redirect_to @orcamento, notice: 'Orcamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @orcamento }
      else
        format.html { render :edit }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orcamentos/1
  # DELETE /orcamentos/1.json
  def destroy
    @orcamento.destroy
    respond_to do |format|
      format.html { redirect_to orcamentos_url, notice: 'Orcamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamento_params
      params.require(:orcamento).permit(:data, :desconto, :obs, :cliente_id, :funcionario_id,
        pedido_attributes: [:id, :_destroy, itens_pedidos_attributes: [:id, :produto_id, :quantidade, :preco]])
    end
end
