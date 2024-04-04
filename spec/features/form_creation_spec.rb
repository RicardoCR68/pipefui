# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Form creation', type: :feature do
  it 'creates a new form' do
    visit '/forms/new'
    fill_in 'Title', with: 'My form'
    click_button 'Create Form'

    expect(page).to have_content('My form')
  end

  it 'does not create a form without a title' do
    visit '/forms/new'
    click_button 'Create Form'

    expect(page).to have_content("Title can't be blank")
  end
end
