class CreateTimetracks < ActiveRecord::Migration
  def change
    create_table :timetracks do |t|
			t.time :login_time
			t.time :logout_time
			t.time :duration
			t.date :date
			t.references :user, index: true

      t.timestamps
    end
  end
end
