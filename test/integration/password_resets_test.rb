require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:one)
  end

  test "password reset" do
    get new_password_reset_path
    assert_template ' password_reset/new'

    # Invalid email
    post password_reset_path, params: { passwor_reset: { email: "" } }
    assert_not flash.empty?
    assert_template 'password_reset/new'

    # Valid email
    post password_reset_path,
         params: { password_reset: { email: @user.email } }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirect_to root_url

  end

end
