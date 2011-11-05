class Kudo < ActiveRecord::Base
  has_many :comments
  belongs_to :from, :class_name => 'User'
  belongs_to :to,   :class_name => 'User'
  belongs_to :season
  has_many :timelines, :as => :event

  validates :message, :presence => true
  validates :from,    :presence => true
  validates :to,      :presence => true
  validates :season,  :presence => true

  validate :cant_be_given_to_self

  protected

  def cant_be_given_to_self
    if from == to
      errors.add(:to, "can't be the same as from")
    end
  end
end
