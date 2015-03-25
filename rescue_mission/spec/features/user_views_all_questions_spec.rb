require 'rails_helper'
# As a user
# I want to view recently posted questions
# So that I can help others
#
# Acceptance Criteria
#
# - I must see the title of each question -check
# - I must see questions listed in order, most recently posted first -check
feature 'user views recently posted questions' do
  let(:question) { FactoryGirl.create(:question) }
  let(:question1) { FactoryGirl.create(:question1) }

  scenario 'question is found in listing' do
    question
    question1


    visit '/questions'
    expect(page).to have_content(question.title)
    expect(page).to have_content(question1.title)

  end
  scenario 'questions are in descending order' do
    question
    question1
    visit '/questions'
    expect(page).to have_selector('li:first-child', text: question.title)
    expect(page).to have_selector('li:nth-child(3)', text: question1.title)
  end
end
