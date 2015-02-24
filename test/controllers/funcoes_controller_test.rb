require 'test_helper'

class FuncoesControllerTest < ActionController::TestCase
  setup do
    @funcao = funcoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcao" do
    assert_difference('Funcao.count') do
      post :create, funcao: { pessoa_id: @funcao.pessoa_id }
    end

    assert_redirected_to funcao_path(assigns(:funcao))
  end

  test "should show funcao" do
    get :show, id: @funcao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcao
    assert_response :success
  end

  test "should update funcao" do
    patch :update, id: @funcao, funcao: { pessoa_id: @funcao.pessoa_id }
    assert_redirected_to funcao_path(assigns(:funcao))
  end

  test "should destroy funcao" do
    assert_difference('Funcao.count', -1) do
      delete :destroy, id: @funcao
    end

    assert_redirected_to funcoes_path
  end
end
