require 'test_helper'

class ProdutosControllerTest < ActionController::TestCase
  setup do
    @produto = produtos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produtos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produto" do
    assert_difference('Produto.count') do
      post :create, produto: { categoria_produto_id: @produto.categoria_produto_id, cod: @produto.cod, descricao: @produto.descricao, fornecedor_id: @produto.fornecedor_id, marca_id: @produto.marca_id, nome: @produto.nome, valor_custo: @produto.valor_custo, valor_venda: @produto.valor_venda }
    end

    assert_redirected_to produto_path(assigns(:produto))
  end

  test "should show produto" do
    get :show, id: @produto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produto
    assert_response :success
  end

  test "should update produto" do
    patch :update, id: @produto, produto: { categoria_produto_id: @produto.categoria_produto_id, cod: @produto.cod, descricao: @produto.descricao, fornecedor_id: @produto.fornecedor_id, marca_id: @produto.marca_id, nome: @produto.nome, valor_custo: @produto.valor_custo, valor_venda: @produto.valor_venda }
    assert_redirected_to produto_path(assigns(:produto))
  end

  test "should destroy produto" do
    assert_difference('Produto.count', -1) do
      delete :destroy, id: @produto
    end

    assert_redirected_to produtos_path
  end
end
