require 'test_helper'

class InformaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get informa_index_url
    assert_response :success
  end

end
