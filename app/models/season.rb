class Season < ActiveRecord::Base
  validates :start_date, :end_date, :starting_kudos, :max_kudos_per_user, :presence => true

  belongs_to :group
  has_many :kudos
  has_many :prizes
end
