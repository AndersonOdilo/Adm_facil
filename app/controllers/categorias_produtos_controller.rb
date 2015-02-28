class CategoriasProdutosController < ApplicationController
  before_action :set_categoria_produto, only: [:show, :edit, :update, :destroy]

  # GET /categorias_produtos
  # GET /categorias_produtos.json
  def index
    @categorias_produtos = CategoriaProduto.all
  end

  # GET /categorias_produtos/1
  # GET /categorias_produtos/1.json
  def show
  end

  # GET /categorias_produtos/new
  def new
    @categoria_produto = CategoriaProduto.new
  end

  # GET /categorias_produtos/1/edit
  def edit
  end

  # POST /categorias_produtos
  # POST /categorias_produtos.json
  def create
    @categoria_produto = CategoriaProduto.new(categoria_produto_params)

    respond_to do |format|
      if @categoria_produto.save
        format.html { redirect_to @categoria_produto, notice: 'Categoria produto was successfully created.' }
        format.json { render json: @categoria_produto }
      else
        format.html { render :new }
        format.json { render json: @categoria_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categorias_produtos/1
  # PATCH/PUT /categorias_produtos/1.json
  def update
    respond_to do |format|
      if @categoria_produto.update(categoria_produto_params)
        format.html { redirect_to @categoria_produto, notice: 'Categoria produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoria_produto }
      else
        format.html { render :edit }
        format.json { render json: @categoria_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorias_produtos/1
  # DELETE /categorias_produtos/1.json
  def destroy
    @categoria_produto.destroy
    respond_to do |format|
      format.html { redirect_to categorias_produtos_url, notice: 'Categoria produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria_produto
      @categoria_produto = CategoriaProduto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_produto_params
      params.require(:categoria_produto).permit(:descricao)
    end
end
