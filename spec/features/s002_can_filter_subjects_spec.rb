require 'rails_helper'
describe 'S002: User can filter subjects by semester' do
  before :each do
    Subject.create(name: 'Fun with Angular', study_path: 'IMI-B', semester_info: '1')
    Subject.create(name: 'Fun with React', study_path: 'IMI-B', semester_info: 'AWE')
  end
  it 'links to specific subject overview' do
    visit subjects_path

    click_link('Semester 1')
    
    expect(page).to have_content('Fun with Angular')
    expect(page).to have_no_content('Fun with React')
  end
end