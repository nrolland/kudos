require 'spec_helper'

describe TimelineObserver do
  it "should create a new entry in the timeline if a kudo is created" do
    original_timeline_size = Timeline.all.size
    kudos = Factory(:kudos)
    updated_timeline_size = Timeline.all.size
    updated_timeline_size.should be > original_timeline_size
  end
end
