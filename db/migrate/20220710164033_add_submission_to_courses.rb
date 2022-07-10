class AddSubmissionToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :submission, :boolean
  end
end
