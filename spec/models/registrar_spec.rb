require 'rails_helper'

RSpec.describe Registrar, type: :model do
  subject { create(:registrar) }
  
  it{is_expected.to(validate_presence_of(:first_name))}
  it{is_expected.to(validate_presence_of(:middle_name))}
  it{is_expected.to(validate_presence_of(:last_name))}
  it{is_expected.to(validate_presence_of(:email))}
end
