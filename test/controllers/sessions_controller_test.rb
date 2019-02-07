require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path  #updated with the new route generated
    assert_response :success
  end

end
