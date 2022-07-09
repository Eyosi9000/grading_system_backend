class ClassRoom < ApplicationRecord
  has_many :student
  belongs_to :course
  belongs_to :instructor

  validates :class_room_no, :semester, :year, presence: true
  validates :class_room_no, numericality: true
end
