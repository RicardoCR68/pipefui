require 'rails_helper'

RSpec.describe 'Answers', type: :request do
  subject(:form) { create(:form) }

  describe 'GET /index' do
    before { get form_answers_path(form) }

    it { expect(response).to be_successful }
  end

  describe 'GET /new' do
    before { get new_form_answer_path(form) }

    it { expect(response).to be_successful }
  end

  describe 'POST /create' do
    context 'with valid params' do
      let (:params) { { answer: attributes_for(:answer) } }

      it { expect { post form_answers_path(form), params: }.to change { Answer.count }.by(1) }
    end

    context 'with invalid params' do
      let (:params) { { answer: { email: nil } } }

      it { expect { post form_answers_path(form), params: }.not_to change(Answer, :count) }
    end
  end

  describe 'GET /show' do
    let(:answer) { create(:answer, form:) }

    before { get form_answer_path(form, answer) }

    it { expect(response).to be_successful }
    it { expect(response.body).to include(answer.email) }
  end

  describe 'GET /edit' do
    let(:answer) { create(:answer, form:) }

    before { get edit_form_answer_path(form, answer) }

    it { expect(response).to be_successful }
  end

  describe 'PATCH /update' do
    let(:params) { { answer: attributes_for(:answer) } }
    let(:answer) { create(:answer, form:) }

    before { expect { patch form_answer_path(form, answer), params: } }

    it { expect(answer,reload.email).to eq(params[:answer][:email]) }
  end

  describe 'PUT /update' do
    let(:params) { { answer: attributes_for(:answer) } }
    let(:answer) { create(:answer, form:) }

    before { expect { put form_answer_path(form, answer), params: } }

    it { expect(answer,reload.email).to eq(params[:answer][:email]) }
  end

  describe 'DELETE /destroy' do
    let!(:answer) { create(:answer, form:) }

    it { expect{ delete form_answer_path(form, answer) }.to change { Answer.count }.by(-1) }
  end

end
