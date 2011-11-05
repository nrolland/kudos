class Prize < ActiveRecord::Base
  belongs_to :season
  has_many :timelines, :as => :event

  validates :season_id, :name, :description,
            :presence => true
end
