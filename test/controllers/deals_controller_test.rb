require 'test_helper'

class DealsControllerTest < ActionDispatch::IntegrationTest

  test "should get deals summary success with regular case" do
    get deals_url
    assert_response :success
  end

  test "should get deals summary success with pages" do
    ENV['PER_PAGE'] = '10'
    get deals_url
    assert_response :success
  end

  test "should get deals summary failed_with_wrong_authentication" do
    ENV['API_KEY'] = 'unknown key'
    get deals_url
    assert_response 401
  end

end
