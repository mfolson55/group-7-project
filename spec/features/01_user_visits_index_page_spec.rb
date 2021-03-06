require 'rails_helper'

feature 'visitors see the index page' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:lincoln) do
    Figure.create!(
      name: 'Abraham Lincoln',
      occupation: 'politician',
      era: '1800s',
      nationality: 'American',
      claim_to_fame: 'Ended slavery',
      user: user
    )
  end

  let!(:admin) do
    User.create!(
      first_name: 'Cameron',
      last_name: 'Cogan',
      role: 'admin',
      email: 'admin@launch.com',
      password: 'password'
    )
  end

  scenario 'visitor visits the index page' do
    visit figures_path
    expect(page).to have_content 'Abraham Lincoln'
  end

  scenario 'clicking figure will take the user to the Figure\'s show page' do
    visit figures_path
    click_link 'Abraham Lincoln'
    expect(current_path).to eq figure_path(lincoln)
  end
end
