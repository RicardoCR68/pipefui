require 'rails_helper'

RSpec.describe 'Forms', type: :request do
  describe 'GET /index' do
    context 'when there are no forms' do
      before { get forms_path }

      it { expect(response).to be_successful }
      it { expect(response.body).to include('No forms') }
    end

    context 'when there are forms' do
      let!(:form) { create(:form) }

      before { get forms_path }

      it { expect(response).to be_successful }
      it { expect(response.body).to include(form.title) }
    end
  end

  describe 'GET /new' do
    before { get new_form_path }

    it { expect(response).to be_successful }
  end

  describe 'POST /create' do
    context 'with valid params' do
      let(:params) { { form: { title: 'My title' } } }

      it { expect { post forms_path, params: }.to change { Form.count }.by(1) }
    end

    context 'with invalid params' do
      let(:params) { { form: { title: nil } } }

      it { expect { post forms_path, params: }.not_to change(Form, :count) }
    end
  end

  describe 'GET /show' do
    let(:form) { create(:form) }

    context 'when there are no fields' do
      before { get form_path(form) }

      it { expect(response).to be_successful }
      it { expect(response.body).to include('No fields') }
    end

    context 'when there are fields' do
      let!(:field) { create(:field, form:) }

      before { get form_path(form) }

      it { expect(response).to be_successful }
      it { expect(response.body).to include(field.label) }
      it { expect(response.body).to include(field.kind) }
    end
  end

  describe 'GET /edit' do
    let(:form) { create(:form) }

    before { get edit_form_path(form) }

    it { expect(response).to be_successful }
  end

  describe 'PATCH /update' do
    context 'with valid params' do
      let(:params) { { form: { title: 'My title' } } }
      let(:form) { create(:form) }

      before { patch form_path(form), params: }

      it { expect(form.reload.title).to eq('My title') }
    end

    context 'with invalid params' do
      let(:params) { { form: { title: nil } } }
      let(:form) { create(:form) }

      it { expect { patch form_path(form), params: }.not_to change(form, :title) }
    end
  end

  describe 'PUT /update' do
    context 'with valid params' do
      let(:params) { { form: { title: 'My title' } } }
      let(:form) { create(:form) }

      before { put form_path(form), params: }

      it { expect(form.reload.title).to eq('My title') }
    end

    context 'with invalid params' do
      let(:params) { { form: { title: nil } } }
      let(:form) { create(:form) }

      it { expect { put form_path(form), params: }.not_to change(form, :title) }
    end
  end

  describe 'DELETE /destroy' do
    let!(:form) { create(:form) }

    it { expect { delete form_path(form) }.to change { Form.count }.by(-1) }
  end
end
