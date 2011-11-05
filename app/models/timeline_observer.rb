class TimelineObserver < ActiveRecord::Observer
  observe :kudo, :prize, :comment, :season

  def after_save(object)
    Timeline.create(:event_id => object.id, :event_type => object.class.to_s)
  end
end
