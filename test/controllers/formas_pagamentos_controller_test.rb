require 'test_helper'

class FormasPagamentosControllerTest < ActionController::TestCase
  setup do
    @forma_pagamento = formas_pagamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formas_pagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forma_pagamento" do
    assert_difference('FormaPagamento.count') do
      post :create, forma_pagamento: { descricao: @forma_pagamento.descricao }
    end

    assert_redirected_to forma_pagamento_path(assigns(:forma_pagamento))
  end

  test "should show forma_pagamento" do
    get :show, id: @forma_pagamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forma_pagamento
    assert_response :success
  end

  test "should update forma_pagamento" do
    patch :update, id: @forma_pagamento, forma_pagamento: { descricao: @forma_pagamento.descricao }
    assert_redirected_to forma_pagamento_path(assigns(:forma_pagamento))
  end

  test "should destroy forma_pagamento" do
    assert_difference('FormaPagamento.count', -1) do
      delete :destroy, id: @forma_pagamento
    end

    assert_redirected_to formas_pagamentos_path
  end
end
