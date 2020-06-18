class CustomerInfo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  field :customer_name, type: String
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :email, presence: true, uniqueness: true
  validates :customer_name, presence: true
end
