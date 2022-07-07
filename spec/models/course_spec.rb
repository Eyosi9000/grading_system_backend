require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { create(:course) }
  
  it{is_expected.to(validate_presence_of(:course_name))}
  it{is_expected.to(validate_presence_of(:credit_hour))}
  it{is_expected.to(validate_numericality_of(:credit_hour))}
  it{is_expected.to(validate_presence_of(:submission))}
end
