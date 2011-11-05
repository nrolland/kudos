require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Example User", :email => "email@viavansi.com", :password => "lorem", :role => "admin"}
    @group = Factory(:group)
  end

  it "should save a user that belongs to a group" do
    user_test = @group.users.new(@attr)
    user_test.should be_valid
  end

  it "should not save a user that doesn't belongs to a group" do
    user_test = User.new(@attr)
    user_test.should_not be_valid
  end

  it "should not save user without all required fields filled" do
    user_test = @group.users.new(@attr.merge(:name => ""))
    user_test.should_not be_valid

    user_test = @group.users.new(@attr.merge(:email => ""))
    user_test.should_not be_valid

    user_test = @group.users.new(@attr.merge(:password => ""))
    user_test.should_not be_valid

    user_test = @group.users.new(@attr.merge(:role => ""))
    user_test.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = @group.users.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = @group.users.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    @group.users.create!(@attr)
    user_with_duplicate_email = @group.users.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject invalid role" do
    user_role_invalid = @group.users.new(@attr.merge(:role => :lorem))
    user_role_invalid.should_not be_valid

    user_role_invalid = @group.users.new(@attr.merge(:role => "lorem"))
    user_role_invalid.should_not be_valid
  end

end