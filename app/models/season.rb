class Season < ActiveRecord::Base
  belongs_to :groups
  has_many :kudos
  has_many :prizes
end
