class Season < ActiveRecord::Base
  validates :start_date, :end_date, :starting_kudos,
            :max_kudos_per_user, :group_id,
            :presence => true

  validates :starting_kudos, :max_kudos_per_user,
            :numericality => { :only_integer => true, :greater_than => 0 }

  validate :season_cannot_start_before_it_ends
  validate :there_is_no_other_active_season

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

  def there_is_no_other_active_season
    if self.group.seasons.find_by_active(true)
      errors.add(:active, "There can only be one active season")
    end
  end
end
