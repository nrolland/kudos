class Kudo < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :timelines, :as => :event

  validates :message, :presence => true
end
