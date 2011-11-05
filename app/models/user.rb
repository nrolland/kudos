class User < ActiveRecord::Base
  ROLES = ["admin", "user"]
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :comments
  has_many :kudos
  belongs_to :group


  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation, :role

  validates :name, :presence => true
  validates :email, :format => { :with => email_regex},
                    :presence => true,
                    :uniqueness => { :case_sensitive => false}
  validates :password, :presence => true
  validates :role, :presence => true,
                   :inclusion =>  {:in => ROLES}
  
  before_save :update_salt

  class << self
    def authenticate(email,submited_password)
      user = find_by_email(email)
      (user && user.has_password?(submited_password)) ? user : nil
    end
    
    def authenticate_with_salt(id,cookie_salt)
      user = find_by_id(id)
      (user && user.salt ==cookie_salt) ? user : nil
    end
    
  end
  
  private
  
    def update_salt
      self.salt = "hola"
    end
    

end
