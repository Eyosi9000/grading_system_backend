require 'rails_helper'

RSpec.describe Instructor, type: :model do
  subject { create(:instructor) }
  
  it{is_expected.to(validate_presence_of(:first_name))}
  it{is_expected.to(validate_presence_of(:middle_name))}
  it{is_expected.to(validate_presence_of(:last_name))}
  it{is_expected.to(validate_presence_of(:email))}
end
