class Customer
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  validates :password, length: { minimum: 8, maximum: 16 }
  validates :password, confirmation: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :email, presence: true, uniqueness: true


  field :email, type: String
  field :password_digest, type: String
  field :description, type: String 

  has_secure_password
end
