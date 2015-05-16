class OrcamentosController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  def add_item
    item_orcamento = ItemOrcamento.new
    produto = Produto.find(params[:produto])
    item_orcamento.produto_id = produto.id
    item_orcamento.preco = produto.valor_venda
    item_orcamento.quantidade = params[:quantidade]
    session[:sub_total] = session[:sub_total].to_f + item_orcamento.preco_total
    render locals: {item_orcamento: item_orcamento, sub_total: session[:sub_total] }
  end

  def remover_item
    produto = Produto.find(params[:produto])
    session[:sub_total] = session[:sub_total].to_f - produto.valor_venda * params[:quantidade].to_f
    render json: (number_to_currency(session[:sub_total].to_f, unit: 'R$', separator: ",", delimiter: ".")).to_json
  end

  def calcular_desconto
    desconto = session[:sub_total].to_f - (session[:sub_total].to_f * params[:desconto].to_f / 100)
    render json: number_to_currency(desconto, unit: 'R$', separator: ",", delimiter: ".").to_json
  end

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    @orcamentos = Orcamento.includes(cliente: [:pessoa]).paginate(page: params[:page], per_page: 10).order("orcamentos.created_at desc")
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
    @orcamento.itens_orcamentos.build
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
      if !@orcamento.itens_orcamentos.blank?
        if @orcamento.save
          format.html { redirect_to @orcamento, notice: 'Orcamento was successfully created.' }
          format.json { render :show, status: :created, location: @orcamento }
        else
          format.html { render :new }
          format.json { render json: @orcamento.errors, status: :unprocessable_entity }
        end
      else
          flash[:danger] = 'Adicione itens ao Orçamento'
          format.html { render :new }
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
      @orcamento = Orcamento.includes(:itens_orcamentos, cliente: [:pessoa], funcionario:[:pessoa]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamento_params
      params.require(:orcamento).permit(:data_validade, :data, :desconto, :obs, :cliente_id, :funcionario_id,
        itens_orcamentos_attributes: [:id, :produto_id, :quantidade, :preco])
    end
end
