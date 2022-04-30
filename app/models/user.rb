class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :age, presence: true, numericality: {greater_than: 0}
  validates :gender, presence: true
  validates :phone_number, presence: true
end
