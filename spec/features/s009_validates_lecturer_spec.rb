require 'rails_helper'
describe 'S009: Validates lecturer' do
  
  it 'creates valid lecturer user' do
    visit 'users/sign_up'

	fill_in('Name', :with => 'Kleinen')
	fill_in('Role', :with => 'lecturer')
	fill_in('Email', :with => 'wi@test.de')
	fill_in('Password', :with => 'hilfehilfe')
	fill_in('Password confirmation', :with => 'hilfehilfe')
	click_button('Sign up')

    expect(page).to have_content("Subjects")
  end

  it 'does not create lecturer user' do
    visit 'users/sign_up'

	fill_in('Name', :with => 'kli')
	fill_in('Role', :with => 'lecturer')
	fill_in('Email', :with => 'wi@test.de')
	fill_in('Password', :with => 'hilfehilfe')
	fill_in('Password confirmation', :with => 'hilfehilfe')
	click_button('Sign up')

    expect(page).to have_content("not found")
  end
end