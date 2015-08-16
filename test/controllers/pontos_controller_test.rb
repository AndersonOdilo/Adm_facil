require 'test_helper'

class PontosControllerTest < ActionController::TestCase
  test "should get registro" do
    get :registro
    assert_response :success
  end

end
