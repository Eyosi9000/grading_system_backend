class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name, :email
  belongs_to :class_room
end
