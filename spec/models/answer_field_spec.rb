require 'rails_helper'

RSpec.describe AnswerField, type: :model do
  describe 'validations' do

    context 'when field is of text kind' do
      subject(:answer_field) { build(:answer_field, :with_text_kind) }

      it { is_expected.to validate_presence_of(:text_body) }
      it { is_expected.not_to validate_presence_of(:string_body) }
    end

    context 'when field is of string kind' do
      subject(:answer_field) { build(:answer_field, :with_string_kind) }

      it { is_expected.to validate_presence_of(:string_body) }
      it { is_expected.not_to validate_presence_of(:text_body) }
    end
  end

  describe 'associations' do
    subject(:answer_field) { build(:answer_field) }

    it { is_expected.to belong_to(:answer) }
    it { is_expected.to belong_to(:field) }
  end
end
