require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
  end

  test "login with invalid information" do
    get login_path #Get the url to test
    #assert_template 'sessions/new'

    post login_path, params: { session: {email: @user.email, password: 'password'} } #get url and send the params email, pass from session controller

    assert_redirected_to @user #to check right redirect
    follow_redirect!

    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0 #if dissappears login links if 0 links
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    # assert_not flash.empty?
    #
    # get root_path
    # assert flash.empty?

  end

end
