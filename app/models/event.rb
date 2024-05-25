class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :attendings, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attendees, through: :attendings, source: :event_attendee, dependent: :destroy

    validates :title, :place, :date, :time, presence: true  
    
    scope :past, -> { where("date < ?", Date.today) }
    scope :upcoming, -> { where("date > ?", Date.today) }
end
