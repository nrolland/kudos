class Kudo < ActiveRecord::Base
  has_many :comments
  has_many :timelines, :as => :event
  belongs_to :from, :class_name => 'User', :foreign_key => 'from'
  belongs_to :to,   :class_name => 'User', :foreign_key => 'to'
  belongs_to :season

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
