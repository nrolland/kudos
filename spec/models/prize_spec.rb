require 'spec_helper'

describe Prize do

  before(:each) do
    @group  = Factory(:group)

    @season = Factory(:season, :group => @group)

    @attrs = {
      :name => 'Sample prize name',
      :description => 'Sample prize description',
      :season => @season
    }
  end

  it "Should save a valid Prize" do
    prize = Prize.create(@attrs)
    prize.should be_valid
  end

  it "Should not save a Prize without all required fields filled" do
    prize = Prize.create(@attrs.merge(:name => ''))
    prize.should_not be_valid

    prize = Prize.create(@attrs.merge(:description => ''))
    prize.should_not be_valid

    prize = Prize.create(@attrs.merge(:season => nil))
    prize.should_not be_valid
  end
end
