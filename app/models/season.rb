class Season < ActiveRecord::Base
  belongs_to :groups
  has_many :kudos
  
end
