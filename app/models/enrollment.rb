class Enrollment < ApplicationRecord
  belongs_to :user 
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id, message: "You have already registered for this event" }
end
