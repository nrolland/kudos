require 'spec_helper'

describe "timeline listing" do
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
    render
  end

  it "should include the expected elements" do
    rendered.should have_selector '.kudos'
  end
end
