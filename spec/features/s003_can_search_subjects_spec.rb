require 'rails_helper'
describe 'S003: User can search for subjects by entering text' do
  before :each do
    Subject.create(name: 'Fun with Angular', study_path: 'IMI-B', semester_info: '1')
    Subject.create(name: 'Fun with React', study_path: 'IMI-B', semester_info: 'AWE')
  end

  it 'shows correct results based on query' do
    visit subjects_path
    
    fill_in('keywords', :with => 'Angular')
    click_button('submit-keywords')
    
    expect(page).to have_content('Fun with Angular')
    expect(page).to have_no_content('Fun with React')
  end

  it 'shows all subjects if no input' do
    visit subjects_path
    
    click_button('submit-keywords')
    
    for subject in Subject.all do
      expect(page).to have_content(subject.name)
    end
  end

  it 'includes whitespaces in search' do
    visit subjects_path
    
    fill_in('keywords', :with => 'with React')
    click_button('submit-keywords')
    
    expect(page).to have_content('Fun with React')
    expect(page).to have_no_content('Fun with Angular')
  end
end