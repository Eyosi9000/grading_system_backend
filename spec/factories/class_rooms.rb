FactoryBot.define do
  factory :class_room do
    association :student
    association :course
    instructor factory: :instructor
    class_room_no { 1 }
    semester { Faker::Lorem.word }
    grade { Faker::Lorem.characters(number: 1) }
  end
end
