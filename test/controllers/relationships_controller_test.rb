require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "create require logged-in-user" do
    assert_no_difference 'Relationship.count' do
      post relationship_path
    end
    assert_redirected_to login_url
  end

  test "destroy require logged-in-user" do
    assert_no_difference 'Relationship.count' do
      delete relationship_path(relationships(:one))
    end
    assert_redirected_to login_url
  end

end
