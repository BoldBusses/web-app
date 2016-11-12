class CreateRiderships < ActiveRecord::Migration[5.0]
  def change
    create_table :riderships do |t|
      t.integer :student_id
      t.integer :route_id
      t.datetime :pickup_time

      t.timestamps
    end
  end
end
