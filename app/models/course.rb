class Course < ApplicationRecord
    validates :course_name, :credit_hour, :submission, presence: true
    validates :credit_hour, numericality: true
end
