class CategoriasProdutosController < ApplicationController

  # GET /categorias_produtos/new
  def new
    @categoria_produto = CategoriaProduto.new
  end

  # POST /categorias_produtos
  # POST /categorias_produtos.json
  def create
    @categoria_produto = CategoriaProduto.new(categoria_produto_params)
    if @categoria_produto.save
      render json: @categoria_produto
    else
      render json: @categoria_produto.errors, status: :unprocessable_entity 
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_produto_params
      params.require(:categoria_produto).permit(:descricao)
    end
end
