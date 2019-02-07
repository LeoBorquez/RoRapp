require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "login with invalid information" do
    get login_path #Get the url to test
    assert_template 'sessions/new'

    post login_path, params: { session: {email: "", password: ""} } #get url and send the params email, pass from session controller
    assert_template 'sessions/new'

    assert_not flash.empty?

    get root_path
    assert flash.empty?

  end

end
