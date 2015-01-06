class CreateTimetracks < ActiveRecord::Migration
  def change
    create_table :timetracks do |t|

      t.timestamps
    end
  end
end
