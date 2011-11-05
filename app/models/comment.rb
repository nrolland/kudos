class Comment < ActiveRecord::Base
  COMMENT_VALUE = -1..1

  belongs_to :user
  belongs_to :kudo

  validates :value, :inclusion => { :in => COMMENT_VALUE }
  validates :user_id, :presence => true
  validates :kudo_id, :presence => true
end
