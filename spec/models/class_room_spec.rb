require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  subject { create(:class_room) }

  it{is_expected.to(validate_presence_of(:class_room_no))}
  it{is_expected.to(validate_presence_of(:semester))}
  it{is_expected.to(validate_presence_of(:grade))}
  it{is_expected.to(belong_to(:course))}
  it{is_expected.to(belong_to(:instructor))}
  it{is_expected.to(belong_to(:student))}
end
