require 'spec_helper'

describe Comment do
  before(:each) do
    @group  = Factory(:group)

    @chuck  = Factory(:user, :name => 'Chuck Norris',
                             :email => 'chuck@example.com',
                             :group => @group)

    @amedio = Factory(:user, :name => 'Mono Amedio',
                             :email => 'amedio@example.com',
                             :group => @group)

    @season = Factory(:season, :group => @group)

    @kudo   = Factory(:kudo, :season => @season,
                             :from => @chuck,
                             :to => @amedio)

    @attrs = {
                :text => 'Sample comment text',
                :user => @chuck,
                :kudo => @kudo,
                :value => 1
              }
  end

  it "Should save a comment if its value it's in valid range" do
    valid_comment = Comment.new(@attrs.merge(:value => 1))
    valid_comment.should be_valid

    valid_comment = Comment.new(@attrs.merge(:value => 0))
    valid_comment.should be_valid

    valid_comment = Comment.new(@attrs.merge(:value => -1))
    valid_comment.should be_valid
  end

  it "Should not save a comment if its value it's not in valid range" do
    invalid_comment = Comment.new(@attrs.merge(:value => 2))
    invalid_comment.should_not be_valid

    invalid_comment = Comment.new(@attrs.merge(:value => -2))
    invalid_comment.should_not be_valid
  end

  it "Should not save a comment if it not belongs to an User and a Kudo" do
    invalid_comment = Comment.new(@attrs.merge(:user => nil))
    invalid_comment.should_not be_valid

    invalid_comment = Comment.new(@attrs.merge(:kudo => nil))
    invalid_comment.should_not be_valid

    invalid_comment = Comment.new(@attrs.merge(:user => nil, :kudo => nil))
    invalid_comment.should_not be_valid
  end
end
