require 'rails_helper'

# As a user
# I want to view a question's details
# So that I can effectively understand the question
#
# Acceptance Criteria
#
# - I must be able to get to this page from the questions index -check
# - I must see the question's title -check
# - I must see the question's description -check
feature 'user views the details of a question' do
  let(:question) { FactoryGirl.create(:question) }


  scenario 'details are found in listing' do
    question
    visit "/questions"
    click_link "#{question.title}"
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
