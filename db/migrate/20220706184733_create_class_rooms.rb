class CreateClassRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :class_rooms do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: true
      t.integer :class_room_no, null: false 
      t.string :semester, null: false
      t.string :grade, null: false

      t.timestamps
    end
  end
end
