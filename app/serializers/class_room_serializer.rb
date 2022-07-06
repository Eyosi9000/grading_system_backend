class ClassRoomSerializer < ActiveModel::Serializer
  attributes :id, :class_room_no, :semester, :grade
  has_one :student
  has_one :course
  has_one :instructor
end
