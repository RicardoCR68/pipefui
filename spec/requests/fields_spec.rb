require 'rails_helper'

RSpec.describe 'Fields', type: :request do
  subject(:form) { create(:form) }

  describe 'GET /_index' do
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

  describe 'GET /new' do
    before { get new_form_field_path(form) }

    it { expect(response).to be_successful }
  end

  describe 'POST /create' do
    context 'with valid params' do
      let(:params) { { field: attributes_for(:field)} }

      it { expect { post form_fields_path(form), params: }.to change { Field.count }.by(1) }
    end

    context 'with invalid params' do
      let(:params) { { field: { label: nil } } }

      it { expect { post form_fields_path(form), params: }.not_to change(Field, :count) }
    end
  end

  describe 'GET /edit' do
    let(:field) { create(:field, form:) }

    before { get edit_form_field_path(form, field) }

    it { expect(response).to be_successful }
  end

  describe 'PATCH /update' do
    context 'with valid params' do
      let(:field) { create(:field, form:) }
      let(:params) { { field: attributes_for(:field)} }

      before { patch form_field_path(form, field), params: }

      it { expect(field.reload.label).to eq(params[:field][:label]) }
    end

    context 'with invalid params' do
      let(:field) { create(:field, form:) }
      let(:params) { { field: { label: nil } } }

      before { patch form_field_path(form, field), params: }

      it { expect(field.reload.label).not_to eq(params[:field][:label]) }
    end
  end

  describe 'DELETE /destroy' do
    let!(:field) { create(:field, form:) }

    it { expect { delete form_field_path(form, field) }.to change { Field.count }.by(-1) }
  end
end
