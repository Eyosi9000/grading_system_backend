class Student < ApplicationRecord
    belongs_to :class_room
    validates :first_name, :middle_name, :last_name, :email, presence: true
end
