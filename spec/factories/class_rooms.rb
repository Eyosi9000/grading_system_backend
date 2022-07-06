FactoryBot.define do
  factory :class_room do
    student { nil }
    course { nil }
    instructor { nil }
    class_room_no { "MyString" }
    semester { "MyString" }
    grade { "MyString" }
  end
end
