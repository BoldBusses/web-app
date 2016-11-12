class CreateBoardingActions < ActiveRecord::Migration[5.0]
  def change
    create_table :boarding_actions do |t|
      t.integer :trip_id
      t.integer :student_id
      t.boolean :onboard
      t.datetime :boarded_at

      t.timestamps
    end
  end
end
