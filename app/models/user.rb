class User < ApplicationRecord
  has_secure_password #добавляет 2 виртуальных поля пароля для модели 

  validates :name, {presence: true, length: {minimum: 4, maximum: 20}}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  
  #validates :email, uniqueness: true
  has_many :user_star  
end
