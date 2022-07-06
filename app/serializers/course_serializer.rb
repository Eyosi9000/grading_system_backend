class CourseSerializer < ActiveModel::Serializer
  attributes :id, :course_name, :course_description, :credit_hour, :submission
end
