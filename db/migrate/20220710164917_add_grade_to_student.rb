class AddGradeToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :grade, :string
  end
end
