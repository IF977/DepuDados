require 'test_helper'

class EquipeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get equipe_index_url
    assert_response :success
  end

end
