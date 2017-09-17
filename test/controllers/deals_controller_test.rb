require 'test_helper'

class DealsControllerTest < ActionDispatch::IntegrationTestd
  test "should get index" do
    get deals_url
    assert_response :success
  end
end
