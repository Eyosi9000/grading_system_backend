FactoryBot.define do
  factory :course do
    course_name { "MyString" }
    course_description { "MyString" }
    credit_hour { 1 }
    submission { false }
  end
end
