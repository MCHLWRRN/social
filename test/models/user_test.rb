require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user1 = users(:user1)
  	@user2 = users(:user2)
  end


  test "saves with valid attributes" do
  	@user1.email = @user2.email

  	assert_not @user1.valid?
  end

  test "should follow leader" do
  	@user1.follow!(@user2)

  	assert_equal 1, @user1.leaders.count
  	assert_equal 1, @user2.followers.count
  end

  test "following? should be true" do
  	@user1.follow!(@user2)

  	assert @user1.following?(@user2)
  end

  test "TextPost requires body" do
  	assert_instance_of TextPost, @post1

  	@post1.body = nil

  	assert_not @post1.valid?
  end

  test "ImagePost requires url" do
  	assert_instance_of ImagePost, @post2

  	@post2.url = nil

  	assert_not @post2.valid?
  end

end
