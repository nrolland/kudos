class Prize < ActiveRecord::Base
  belongs_to :season

  validates :season_id, :name, :description,
            :presence => true
end
