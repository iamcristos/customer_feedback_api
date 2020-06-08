class Customer
  include Mongoid::Document
  include Mongoid::Timestamps
  validates :password, length: { minimum: 8, maximum: 16 }
  validates :password, confirmation: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  
  field :email, type: String
  field :password, type: String
  field :description, type: String 
end
