class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :inventory
  has_many :customers, class_name: "User", foreign_key: "business_id"
  belongs_to :business, class_name: "User", optional: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
