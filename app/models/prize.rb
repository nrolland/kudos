class Prize < ActiveRecord::Base
  belongs_to :season
  has_many :timelines, :as => :event
end
