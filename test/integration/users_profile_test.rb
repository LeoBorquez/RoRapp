require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  include ApplicationHelper

  def setup
    @user = users(:one)
  end

  test "profile display" do
    get users_path(@user)
    assert_template 'user/show'
    assert_select 'tittle', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination'
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body # Contains the full HTML source of the page
    end
  end

end
