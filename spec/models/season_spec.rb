require 'spec_helper'

describe Season do
  before :each do
    @group = Factory(:group)
    @season = Factory(:season, :group => @group)
  end

  describe 'creation' do
    it "should be valid if it has all the necessary data" do
      @season.should be_valid
    end

    it "should not be valid if any of the required fields is not filled" do
      @season.start_date = nil
      @season.should_not be_valid

      @season.end_date = nil
      @season.should_not be_valid

      @season.starting_kudos = nil
      @season.should_not be_valid

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

    it "should not save a season if there is another active one" do
      Factory(:season, :active => true)

      season = Factory(:season, :active => true)
      season.should_not be_valid
    end

    it "should save a season if there isn't another active one" do
      season =  Factory(:season, :group => @group, :active => true)

      season.errors.empty?.should be_true
    end
  end
end
