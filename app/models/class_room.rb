class ClassRoom < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :instructor

  validates :class_room_no, :semester, :grade, presence: true
  validates :class_room_no, numericality: true
end
