class Comment < ActiveRecord::Base
  COMMENT_VALUE = -1..1

  belongs_to :user
  belongs_to :kudo
  has_many :timelines, :as => :event

  validates :value, :inclusion => { :in => COMMENT_VALUE }
end
