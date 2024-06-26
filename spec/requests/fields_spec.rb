require 'rails_helper'

RSpec.describe 'Fields', type: :request do
  subject(:form) { create(:form) }

  describe 'GET /new' do
    before { get new_form_field_path(form) }

    it { expect(response).to be_successful }
  end

  describe 'POST /create' do
    context 'with valid params' do
      let(:params) { { field: { label: 'My label', kind: 'text' } } }

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
      let(:params) { { field: { label: 'New Label', kind: 'text' } } }

      before { patch form_field_path(form, field), params: }

      it { expect(field.reload.label).to eq('New Label') }
    end

    context 'with invalid params' do
      let(:field) { create(:field, form:) }
      let(:params) { { field: { label: nil } } }

      it { expect { patch form_field_path(form, field), params: }.not_to change(field, :label) }
    end
  end

  describe 'PUT /update' do
    context 'with valid params' do
      let(:field) { create(:field, form:) }
      let(:params) { { field: { label: 'New Label', kind: 'text' } } }

      before { put form_field_path(form, field), params: }

      it { expect(field.reload.label).to eq('New Label') }
    end

    context 'with invalid params' do
      let(:field) { create(:field, form:) }
      let(:params) { { field: { label: nil } } }

      it { expect { put form_field_path(form, field), params: }.not_to change(field, :label) }
    end
  end

  describe 'DELETE /destroy' do
    let!(:field) { create(:field, form:) }

    it { expect { delete form_field_path(form, field) }.to change { Field.count }.by(-1) }
  end
end
