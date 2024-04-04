# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Fields creation', type: :feature do
  subject(:form) { create(:form) }

  it 'creates fields in a form' do
    visit form_path(form)
    click_link 'Add Fields'
    fill_in 'Label', with: 'My field'
    select 'text', from: 'Kind'
    click_button 'Create Field'

    expect(page).to have_content('My field')
    expect(page).to have_content('text')
  end

  it 'does not create invalid field' do
    visit form_path(form)
    click_link 'Add Fields'
    click_button 'Create Field'

    expect(page).to have_content("Label can't be blank")
  end
end