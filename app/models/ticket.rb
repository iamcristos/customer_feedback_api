class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

  field :closed, type: Boolean, default: false
end
