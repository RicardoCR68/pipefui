require 'rails_helper'

RSpec.describe Field, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_inclusion_of(:kind).in_array(%w[text string]) }

    context 'when kind is text' do
      let(:field) { build(:field, :text) }

      it { is_expected.not_to validate_presence_of(:string_body) }
    end

    context 'when kind is string' do
      let(:field) { build(:field, :string) }

      it { is_expected.not_to validate_presence_of(:text_body) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:form) }
  end
end
