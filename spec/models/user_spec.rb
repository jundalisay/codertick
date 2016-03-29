require 'rails_helper'

RSpec.describe User, type: :model do
	# it "authenticates with matching username and password" do
	# 	user = User.create!(username: "jun", password: "secret")
	# 	# User.authenticate("jun", "secret").should eq(user)
	# end

  # from http://stackoverflow.com/questions/7537112/rails-3-1-rspec-testing-model-validations
  before(:each) do
    @user = User.new
    @user.username = "a valid username"
 end

  it "should require a username" do
    # user = User.create(:username => "")
    user.valid?
    user.errors.should have_key(:username)
  end
  
  # it "validation on presence of name" do
  #   user = User.new
  #   assert_equal user.save, false, "Should not be able to save without a name"
  # end

  # test "validation on inclusion of name" do
  #   category = Category.new name: "Invalid name"
  #   assert_equal category.save, false
  #   category = Category.new name: "Entertainment"
  #   assert_equal category.save, true
  # end
	
end