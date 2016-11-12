class CreateGuardiansStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :guardians_students do |t|
      t.integer :student_id
      t.integer :guardian_id

      t.timestamps
    end
  end
end
