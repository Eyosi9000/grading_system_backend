FactoryBot.define do
  factory :class_room do
    student factory: :student
    course factory: :course
    instructor factory: :instructor
    class_room_no { 1 }
    semester { Faker::Lorem.word }
    grade { Faker::Lorem.characters(number: 1) }
  end
end
