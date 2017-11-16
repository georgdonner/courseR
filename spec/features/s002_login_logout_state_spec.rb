require 'rails_helper'
describe 'S002: Change login/logout buttons depending on user login status' do
  before :each do
    user = User.create(email: 'jule@fink.de', password: 'geheim', password_confirmation: 'geheim')
    login_as(user, :scope => :user)
  end
  
  it 'changes login button to logout after login' do
    visit root_path

    expect(page).to have_content('Logout')
    expect(page).to have_no_content('Login')
  end

  it 'changes logout button to login after logout' do
    visit root_path
    logout(:user)

    expect(page).to have_content('Login')
    expect(page).to have_no_content('Logout')
  end
end