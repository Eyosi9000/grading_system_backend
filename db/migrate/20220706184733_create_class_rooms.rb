class CreateClassRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :class_rooms do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: true
      t.string :class_room_no
      t.string :semester
      t.string :grade

      t.timestamps
    end
  end
end
