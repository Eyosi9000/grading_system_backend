class RemoveSubmissionFromCourse < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :submission, :boolean
  end
end
