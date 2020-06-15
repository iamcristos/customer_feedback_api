class CompanyStaff
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :email, type: String
  field :full_name, type: String
  field :password_digest, type: String
  field :approved, type: Boolean, default: false
  #Ex:- :default =>''
  field :customer_id, type: String 

  # validates :password, length: { minimum: 8, maximum: 16 }
  validates :password, confirmation: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :customer_id, presence: true

  has_secure_password

  scope :customer, -> (customer_id){ where(:customer_id => customer_id)}
  scope :approve, -> { where(:approved => true)}

  belongs_to :customers, foreign_key: "customer_id"
end
