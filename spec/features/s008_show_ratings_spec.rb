require 'rails_helper'
describe 'S008: Shows ratings' do
  
  before :each do
    crypto = Subject.create(name: 'Cryptography', study_path: 'IMI-B', semester_info: 'AWE')
    julius = Lecturer.create(title: 'Prof.', name: 'Julius Deckert', email: 'julius@deckert.de')
    crypto_julius = Course.create(description: 'Insights into cryptogrphy algorithms', subject: crypto, lecturer: julius)
    Rating.create(praxis: 0.7, difficulty: 0.5, homework: 0.4, course: crypto_julius)
  end

  it 'links to specific subject overview' do
    visit 'subject/1'

    expect(page).to have_content('Cryptography')
    expect(page).to have_content('Difficulty')
  end
end
