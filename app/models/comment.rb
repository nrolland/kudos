class Comment < ActiveRecord::Base
  COMMENT_VALUE = [-1, 0, 1]
  
  belongs_to :user, :kudo
  
  validates :value, :inclusion => { :in => COMMENT_VALUE }
end
