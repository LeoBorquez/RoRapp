require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:two)
    @another_user = users(:one)
  end

  test "redirect edit when user isn't logged in" do
    log_in_as(@another_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                             email: @user.email

    }}
    assert flash.empty?
    assert_redirected_to root_url
  end

end
