require 'rails_helper'

RSpec.describe Field, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:label) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_inclusion_of(:kind).in_array(%w[text string]) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:form) }
  end
end
