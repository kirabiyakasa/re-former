class User < ApplicationRecord
  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,16}) #At least 8 characters long
    (?=.*\d) #Contain at least one number
    (?=.*[a-z]) #Contain at least one lowercase letter
    (?=.*[A-Z]) #Contain at least one uppercase letter
  /x

  validates :username, presence: true, uniqueness:true, 
  length: {minimum: 1, maximum: 32}
  validates :email, presence: true, uniqueness: true, allow_blank: false
  validates :password, presence: true, allow_blank: false,
  format: PASSWORD_REQUIREMENTS
end
