require 'test_helper'

class PesquisaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pesquisa_index_url
    assert_response :success
  end

end
