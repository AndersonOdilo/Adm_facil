class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  def autocomplete
    @produtos = Produto.order(:nome).where("nome ILIKE ?", "#{params[:term]}%")
    produtos = []
    @produtos.each do |produto|
      produtos <<  { value: produto.id, label: "#{produto.nome}, #{produto.marca.nome}", preco: produto.preco_venda,
        quantidade: produto.quantidade_estoque, unidade: produto.unidade.sigla}
    end
    respond_to do |format|
      format.html
      format.json {
        render json: produtos
      }
    end
  end

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.includes(:marca, :fornecedor, :categoria_produto).all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
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

    respond_to do |format|
      if @produto.save
        flash[:success] = "Produto salvo com sucesso"
        format.html { redirect_to action: "index", success: 'Produto salvo com sucesso.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        flash[:success] = "Produto foi alterado com sucesso"
        format.html { redirect_to @produto}
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      flash[:success] = "Produto foi excluido com sucesso"
      format.html { redirect_to produtos_url}
      format.json { head :no_content }
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
          :categoria_produto_id, :fornecedor_id, :quantidade_estoque, :unidade_id )
    end
end
