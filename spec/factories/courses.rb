FactoryBot.define do
  factory :course do
    course_name { Faker::Lorem.word }
    course_description { Faker::Lorem.paragraph }
    credit_hour { 1 }
    submission { true }
  end
end
