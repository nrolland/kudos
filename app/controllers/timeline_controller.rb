class TimelineController < ApplicationController
  before_filter :authenticate

  def index
    @timeline = Timeline.all

    respond_to do |format|
      format.html
    end
  end
end
