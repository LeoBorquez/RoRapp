require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @relationship = Relationship.new(follower_id: users(:one).id,
                                     followed_id: users(:gunner).id)
  end

  test "be valid" do
    assert @relationship.valid?
  end

  test "require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end

end
