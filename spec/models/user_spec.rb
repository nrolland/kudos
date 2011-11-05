require 'spec_helper'

describe User do
  it "should not save user without all required fields filled" do 
    user = User.new
    user.should_not be_valid
  end
  
  pending "email format"
  
  pending "email uniqueness"
  
  pending "role valid"
  
end
