class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_description
      t.integer :credit_hour
      t.boolean :submission

      t.timestamps
    end
  end
end
