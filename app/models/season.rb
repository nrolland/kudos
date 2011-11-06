class Season < ActiveRecord::Base
  validates :start_date, :end_date, :starting_kudos, :max_kudos_per_user,
            :presence => true

  validates :starting_kudos, :max_kudos_per_user,
            :numericality => { :only_integer => true, :greater_than => 0 }

  validate :season_cannot_start_before_it_ends

  belongs_to :group
  has_many :kudos
  has_many :prizes
  has_many :timelines, :as => :event

  protected

  def season_cannot_start_before_it_ends
    if not start_date.nil? and not end_date.nil?
      errors.add(:end_date, "can't be previous to start_date") if end_date < start_date
    end
  end
end
