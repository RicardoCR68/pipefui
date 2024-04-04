require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:form) }
    it { is_expected.to have_many(:answer_fields) }
  end
end
