class Customer
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  field :password, type: String
  field :description, type: String 
end
