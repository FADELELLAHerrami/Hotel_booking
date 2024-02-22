class Room < ApplicationRecord
  has_one_attached :photo
  # Association
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  # Validation
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  # for searching using pgsaerch
  include PgSearch::Model
  pg_search_scope :search_room,
  against: [ :price_per_night ],
  associated_against: {
    hotel: [:name,:address]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  #
end
