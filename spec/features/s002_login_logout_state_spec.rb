require 'rails_helper'
describe 'S002: Login status' do
  before :each do
    user = User.create(email: 'jule@fink.de', password: 'geheim', password_confirmation: 'geheim')
    login_as(user, :scope => :user)
  end
  
  it 'changes login button to logout after login' do
    visit root_path

    expect(page).to have_selector("input[type=submit][value='Logout']")
    expect(page).to have_no_selector("input[type=submit][value='Login']")
  end
  
  it 'changes logout button to login after logout' do
    logout(:user)
    visit root_path
    
    expect(page).to have_selector("input[type=submit][value='Login']")
    expect(page).to have_no_selector("input[type=submit][value='Logout']")
  end
end