class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  has_scope :em_falta, type: :boolean
  has_scope :disponivel, type: :boolean

  def autocomplete
    produtos = Produto.order(:nome).where("nome ILIKE ?", "%#{params[:term]}%")
    produtos_json = []
    produtos.collect{|produto|  produtos_json <<  { id: produto.id, value: "#{produto.nome}, #{produto.marca.nome}", 
    preco: produto.valor_venda, quantidade: produto.quantidade_estoque, unidade: produto.unidade.sigla}}
    render json: produtos_json
  end

  # GET /produtos
  # GET /produtos.json
  def index
    if params[:fornecedor]
      @produtos = Produto.includes(:marca, :fornecedor, :categoria_produto).fornecedor(params[:fornecedor])
    else
      @produtos = apply_scopes(Produto).includes(:marca, :fornecedor, :categoria_produto)
    end
    respond_to do |format|
      format.html 
      format.pdf {render pdf: "Produtos"} 
    end 
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    if !@produto.notificacaos.blank?
      if !@produto.notificacao.last.visualizado?
        notificacao = @produto.notificacaos.last
        notificacao.update(visualizado: true)
      end
    end
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to action: "index"
    else
      render :new
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    if @produto.update(produto_params)
      flash[:notice] = "Produto alterado com sucesso"
      redirect_to action: "index"
    else
      render :edit 
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    begin
      @produto.destroy
      flash[:notice] = "Produto foi excluido com sucesso" 
    rescue ActiveRecord::DeleteRestrictionError => e
      flash[:error] = "O Produto não pode ser excluido"
    ensure
      redirect_to produtos_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.includes(:unidade, :fornecedor, :marca, :categoria_produto).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:cod, :nome, :descricao, :valor_custo, :valor_venda, :marca_id,
          :categoria_produto_id, :fornecedor_id, :quantidade_estoque, :unidade_id, :nivel_alerta )
    end
end
