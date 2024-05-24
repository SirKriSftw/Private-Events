class CreateAttendings < ActiveRecord::Migration[7.1]
  def change
    create_table :attendings do |t|
      t.integer "event_attendee_id", null: false
      t.integer "attended_event_id", null: false
      t.timestamps
    end
  end
end
