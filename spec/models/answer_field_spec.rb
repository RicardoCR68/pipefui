require 'rails_helper'

RSpec.describe AnswerField, type: :model do
  describe 'validations' do
    context 'when text' do
      let!(:field) { create(:field, kind: 'text') }
      let!(:answer_field) { create(:answer_field, field:) }

      it { is_expected.to validate_presence_of(:text_body) }
      it { is_expected.not_to validate_presence_of(:string_body) }
    end

    context 'when string' do
      let!(:field) { create(:field, kind: 'string') }
      let!(:answer_field) { create(:answer_field, field:) }

      it { is_expected.to validate_presence_of(:string_body) }
      it { is_expected.not_to validate_presence_of(:text_body) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:answer) }
    it { is_expected.to belong_to(:field) }
  end
end
