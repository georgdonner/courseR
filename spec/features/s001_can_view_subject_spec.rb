require 'rails_helper'
describe 'S001: User can view selected subject' do
  before :each do
    Subject.create(name: 'Fun with Angular.JS', study_path: 'IMI-B')
  end
  it 'links to specific subject overview' do
    visit subjects_path

    expect(page).to have_content('Fun with Angular.JS')

    click_link('Fun with Angular.JS')

    expect(page).to have_current_path(subject_path(Subject.last))
  end
end