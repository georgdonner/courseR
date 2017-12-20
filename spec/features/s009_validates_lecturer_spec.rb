require 'rails_helper'
describe 'S009: Validates lecturer' do
  before :each do
    user = User.create(name: 'fakelecturer', role: 'Lecturer' email: 'fake@fink.de', password: 'geheim', password_confirmation: 'geheim')
  end
  
  it 'creates no lecturer user' do
    visit 'users/sign_up'

    fill_in 'name', with: 'fakelecturer'
    fill_in 'role', with: 'Lecturer'
    fill_in 'email', with: 'fake@fink.de'
    fill_in 'password', with: 'geheim'
    fill_in 'password_confirmation', with: 'geheim'

    expect(page).to have_content("Subjects")
  end
end