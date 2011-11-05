require 'spec_helper'

describe TimelineObserver do
  before :each do
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
    @prize = Factory(:prize, :season => @season)
    @original_timeline_size = Timeline.all.size
  end

  it "should create a new entry in the timeline if a kudo is created" do
    Factory(:kudo, :season => @season, :from => @chuck, :to => @amedio)
    updated_timeline_size = Timeline.all.size
    updated_timeline_size.should be > @original_timeline_size
  end
  it "should create a new entry in the timeline if a comment is created" do
    Factory(:comment, :user => @chuck, :kudo => @kudo)
    updated_timeline_size = Timeline.all.size
    updated_timeline_size.should be > @original_timeline_size
  end
  it "should create a new entry in the timeline if a season is created" do
    Factory(:season, :group => @group)
    updated_timeline_size = Timeline.all.size
    updated_timeline_size.should be > @original_timeline_size
  end
  it "should create a new entry in the timeline if a prize is created" do
    Factory(:prize, :season => @season)
    updated_timeline_size = Timeline.all.size
    updated_timeline_size.should be > @original_timeline_size
  end
  it "should create a new entry in the timeline if a kudo is updated" do
    @kudo.update_attributes :from => @amedio, :to => @chuck
    updated_timeline_size = Timeline.all.size
    updated_timeline_size.should be > @original_timeline_size
  end
  it "should create a new entry in the timeline if a season is updated" do
    @season.update_attributes :end_date => @season.end_date + 1.month
    updated_timeline_size = Timeline.all.size
    updated_timeline_size.should be > @original_timeline_size
  end
  it "should create a new entry in the timeline if a prize is updated" do
    @prize.update_attributes :description => @prize.description.reverse
    updated_timeline_size = Timeline.all.size
    updated_timeline_size.should be > @original_timeline_size
  end
end
