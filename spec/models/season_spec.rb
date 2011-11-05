require 'spec_helper'

describe Season do
  before :each do
    @group = Factory(:group)
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

    it "should only accept positive integer starting kudos" do
      @season.starting_kudos = -2
      @season.should_not be_valid
    end

    it "should only accept positive integer maximum kudos per user" do
      @season.max_kudos_per_user = -2
      @season.should_not be_valid
    end

    it "should not end before it starts" do
      @season.end_date = @season.start_date - 1.year
      @season.should_not be_valid
    end
  end
end
