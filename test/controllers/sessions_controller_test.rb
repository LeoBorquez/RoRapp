require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_login_path  #updated with the new route generated
    assert_response :success
  end

end
