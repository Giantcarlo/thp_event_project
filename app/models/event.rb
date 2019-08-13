class Event < ApplicationRecord

  validates :title, 
    presence: true,
    length: { in: 5..140 }
  validates :start_date,
    presence: true
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
  validate :start_date_must_be_after_now

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :organizer, class_name: "User"

  def duration_must_be_multiple_of_five
    if duration % 5 != 0
      errors.add(:duration, "La durée doit être un multiple de 5")
    end
  end

  def start_date_must_be_after_now
    if start_date > Time.now ? true : 
      errors.add(:start_date, "Ton evenement doit être au futur")
    end
  end
end
