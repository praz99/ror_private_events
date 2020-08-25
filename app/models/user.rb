class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"

  has_many :event_attendings, foreign_key: :event_attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :username, presence: true, length: { minimum: 3 }
end
