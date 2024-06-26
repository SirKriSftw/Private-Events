class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, inverse_of: "creator", class_name: "Event", dependent: :destroy
  has_many :attendings, foreign_key: :event_attendee_id, dependent: :destroy
  has_many :attended_events, through: "attendings", dependent: :destroy
end
