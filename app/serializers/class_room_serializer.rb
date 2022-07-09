class ClassRoomSerializer < ActiveModel::Serializer
  attributes :id, :class_room_no, :semester, :year
  has_many :student
  has_one :course
  has_one :instructor
end
