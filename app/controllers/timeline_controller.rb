class TimelineController < ApplicationController
  before_filter :authenticate

  def index
    @timeline = Timeline.find(:all,
                              :order => "updated_at DESC",
                              :limit => 20,
                              :include => :event).collect {|t| t.event}

    # TODO: RSS/Atom version of the timeline
  end
end
