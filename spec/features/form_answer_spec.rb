# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Form answers', type: :feature do
  let!(:field) { create(:field, form:) }
  subject(:form) { create(:form) }

  before { form.reload }

  it 'answer a form with valid fields' do
    visit form_path(form)
    click_link 'Answers'
    click_link 'New Answer'
    fill_in 'Email', with: 'new_email@example.com'
    fill_in field.label, with: 'Testing custom form field'
    click_button 'Create Answer'

    expect(page).to have_content('new_email@example.com')
    expect(page).to have_content('Testing custom form field')
  end

  it 'does not answer a form with invalid fields' do
    visit form_path(form)
    click_link 'Answers'
    click_link 'New Answer'
    click_button 'Create Answer'

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("body can't be blank")
  end
end
