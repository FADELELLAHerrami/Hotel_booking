class Hotel < ApplicationRecord
  # Association
  has_many :rooms, dependent: :destroy
  # Validation
  validates :name, presence: true
  validates :address, presence: true
end
