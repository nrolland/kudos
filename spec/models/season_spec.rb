require 'spec_helper'

describe Season do
  before :each do
    @season = Factory(:season)
  end

  describe 'creation' do
    it "should be valid if it has all the necessary data" do
      @season.should be_valid
    end

    it "should have a start date" do
      @season.start_date = nil
      @season.should_not be_valid
    end

    it "should have an end date" do
      @season.end_date = nil
      @season.should_not be_valid
    end

    it "should define how many kudos an user may grant" do
      @season.starting_kudos = nil
      @season.should_not be_valid
    end

    it "should define how many kudos an user can receive" do
      @season.max_kudos_per_user = nil
      @season.should_not be_valid
    end
  end
end
