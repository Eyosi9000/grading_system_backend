class RemoveStudentFromClassRoom < ActiveRecord::Migration[7.0]
  def change
    remove_reference :class_rooms, :student, null: false, foreign_key: true
  end
end
