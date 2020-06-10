class CompanyStaff
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  validates :password, length: { minimum: 8, maximum: 16 }
  validates :password, confirmation: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence :true
  validates :customer_id, presence :true

  field :email, type: String
  field :full_name, type: String
  field :password_digest, type: String
  field :approved, type: boolean, default: false
  #Ex:- :default =>''
  field :customer_id, type: String 

  has_secure_password

  belongs_to :customers, foreign_key: "customer_id"
end
