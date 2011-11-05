class Season < ActiveRecord::Base
  belongs_to :group
  has_many :kudos
  has_many :prizes
end
