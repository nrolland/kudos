class Group < ActiveRecord::Base
  has_many :seasons
  has_many :users
  
  validates :name,        :presence => true,
                          :length    => {:maximum => 50, :minimum => 3 }
  validates :description,  :presence => true
end
