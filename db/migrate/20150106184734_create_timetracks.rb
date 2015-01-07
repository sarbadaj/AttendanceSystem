class CreateTimetracks < ActiveRecord::Migration
  def change
    create_table :timetracks do |t|
			t.datetime :login_time
			t.datetime :logout_time
			t.time :duration
			t.references :user, index: true

      t.timestamps
    end
  end
end
