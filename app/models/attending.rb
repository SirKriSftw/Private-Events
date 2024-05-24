class Attending < ApplicationRecord
    belongs_to :event_attendee, class_name: "User"
    belong_to :attended_event, class_name: "Event"
end
