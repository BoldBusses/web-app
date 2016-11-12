class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :route_id
      t.datetime :start_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
