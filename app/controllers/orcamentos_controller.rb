  class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  def add_item
    produto = Produto.find(params[:produto])
    item_orcamento = ItemOrcamento.new(produto_id: produto.id, preco: produto.valor_venda, quantidade: params[:quantidade])
    session[:sub_total] = session[:sub_total].to_f + item_orcamento.preco_total
    render locals: {item_orcamento: item_orcamento, sub_total: session[:sub_total] }
  end

  def remover_item
    produto = Produto.find(params[:produto])
    session[:sub_total] = session[:sub_total].to_f - produto.valor_venda * params[:quantidade].to_f
    render json: session[:sub_total].to_f.to_json
  end

  def calcular_desconto
    desconto = session[:sub_total].to_f - (session[:sub_total].to_f * params[:desconto].to_f / 100)
    render json: desconto.to_json
  end

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    @orcamentos = Orcamento.includes(:itens_orcamentos, cliente: [:pessoa]).order("orcamentos.created_at desc")
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
    session[:sub_total] = @orcamento.total
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    @orcamento = Orcamento.new(orcamento_params)
    if !@orcamento.itens_orcamentos.blank?
      if @orcamento.save
        flash[:notice] = "Orçamento salvo com sucesso"
        redirect_to @orcamento
      else
        render :new 
      end
    else
        flash[:alert] = 'Adicione itens ao Orçamento'
        render :new
    end
  end

  # PATCH/PUT /orcamentos/1
  # PATCH/PUT /orcamentos/1.json
  def update
    if !@orcamento.itens_orcamentos.blank?
      if @orcamento.update(orcamento_params)
        redirect_to @orcamento, notice: 'Orçamento alterado com sucesso' 
      else
        render :edit
      end
    else
      flash[:alert] = 'Adicione itens ao Orçamento'
      render :new 
    end
  end

  # DELETE /orcamentos/1
  # DELETE /orcamentos/1.json
  def destroy
    @orcamento.destroy
    flash[:notice] = "Orçamento excluido com sucesso"
    redirect_to orcamentos_url
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
