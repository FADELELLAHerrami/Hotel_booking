class Booking < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :room
  # Validation
  validates :starts_at, presence: true
  validates :ends_date, presence: true
  validate :starts_at_must_be_before_ends_date

  private

  def starts_at_must_be_before_ends_date
    errors.add(:starts_at, "must be before ends date") if starts_at && ends_date && starts_at >= ends_date
  end
end
