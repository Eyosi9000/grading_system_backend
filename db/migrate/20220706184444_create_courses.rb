class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :course_name, null: false
      t.text :course_description
      t.integer :credit_hour, null: false
      t.boolean :submission, null: false

      t.timestamps
    end
  end
end
