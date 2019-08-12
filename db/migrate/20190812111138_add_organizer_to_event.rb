class AddOrganizerToEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :organizer, index: true
  end
end
