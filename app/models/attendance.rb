class Attendance < ApplicationRecord
  after_create :notify_organizer

  belongs_to :user
  belongs_to :event

  def notify_organizer
    UserMailer.organizer_notification(self.event).deliver_now
  end

end
