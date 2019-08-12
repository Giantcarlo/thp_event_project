class Event < ApplicationRecord

  validates :title, 
    presence: true,
    length: { in: 5..140 }
  validates :start_date,
    presence: true,
    numericality: {greater_than: DateTime.now.to_i}
  validates :duration,
    presence: true,
    numericality: { greater_than: 0 }
  validates :description,
    presence: true,
    length: { in: 20..1000 }
  validates :price,
    presence: true,
    numericality: { greater_than: 0 },
    numericality: { less_than: 1000 }
  validates :location,
    presence: true

  validate :duration_must_be_multiple_of_five

  has_many :attendances
  has_many :users, through: :attendances

  def duration_must_be_multiple_of_five
    if duration % 5 != 0
      errors.add(:duration, "Duration must be a multiple of 5")
    end
  end
end
