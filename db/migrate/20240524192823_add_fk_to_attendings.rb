class AddFkToAttendings < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key "attendings", "events", column: "attended_event_id"
    add_foreign_key "attendings", "users", column: "event_attendee_id"
  end
end
