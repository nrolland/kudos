require 'spec_helper'

describe Group do
  
  before(:each) do
    @attr = { :name => "Viavansi Group", :description => "example of description" }
  end
  
  it "should required a name" do
    no_name_group =Group.new(@attr.merge(:name=>""))
    no_name_group.should_not be_valid
  end  
  
  it "should reject name that are too long" do
    long_name="Name too big"*50
    long_name_group =Group.new(@attr.merge(:name=>long_name))
    long_name_group.should_not be_valid
  end  
  

  it "should reject name that are too small" do
    sort_name="aa"
    sort_name_group=Group.new(@attr.merge(:name=>sort_name))
    sort_name_group.should_not be_valid
  end   
  
  it "should required a description" do
    no_description_group =Group.new(@attr.merge(:description=>""))
    no_description_group.should_not be_valid
  end  
  
end
