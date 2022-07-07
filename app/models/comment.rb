class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :post
  belongs_to :user
  has_many :responds, dependent: :destroy
end
