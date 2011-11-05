require 'spec_helper'

describe Kudo do

  before(:each) do
    @group  = Factory(:group)

    @chuck  = Factory(:user, :name => 'Chuck Norris',
                             :email => 'chuck@example.com',
                             :group => @group)

    @amedio = Factory(:user, :name => 'Mono Amedio',
                             :email => 'amedio@example.com',
                             :group => @group)

    @season = Factory(:season, :group => @group)

    @attrs = {
      :message => 'Sample kudo message',
      :from => @chuck,
      :to => @amedio,
      :season => @season,
    }
  end

  it "Should save a valid Kudo" do
    kudo = Kudo.create(@attrs)
    kudo.should be_valid
  end

  it "Should not save a Kudo without all required fields filled" do
    kudo = Kudo.create(@attrs.merge(:message => ''))
    kudo.should_not be_valid

    kudo = Kudo.create(@attrs.merge(:from => nil))
    kudo.should_not be_valid

    kudo = Kudo.create(@attrs.merge(:to => nil))
    kudo.should_not be_valid

    kudo = Kudo.create(@attrs.merge(:season => nil))
    kudo.should_not be_valid
  end

  it "Should not save a Kudo given to self" do
    kudo = Kudo.create(@attrs.merge(:from => @chuck, :to => @chuck))
    kudo.should_not be_valid
  end
end
