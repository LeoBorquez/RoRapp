require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
  end

  test "login with invalid information followed by logout" do
    get login_path #Get the url to test
    #assert_template 'sessions/new'

    post login_path, params: { session: {email: @user.email, password: 'password'} } #get url and send the params email, pass from session controller

    assert is_logged_in?
    assert_redirected_to @user #to check right redirect
    follow_redirect!

    assert_template 'users/show'

    assert_select "a[href=?]", login_path, count: 0 #if dissappears login links if 0 links
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!

    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0


    # assert_not flash.empty?
    #
    # get root_path
    # assert flash.empty?

  end

end
