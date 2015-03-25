require 'rails_helper'

# As a user
# I want to view the answers for a question
# So that I can learn from the answer
#
# Acceptance Criteria
#
# - I must be on the question detail page-check
# - I must only see answers to the question I'm viewing-check
# - I must see all answers listed in order, most recent last
feature 'user views question answers' do
  let(:question) { FactoryGirl.create(:question) }
  let(:question1) { FactoryGirl.create(:question1) }
  let(:comment) { FactoryGirl.create(:comment) }
  let(:comment1) { FactoryGirl.create(:comment1) }
  let(:comment2) { FactoryGirl.create(:comment2) }


  scenario 'answers are specific to answer' do
    question
    comment
    comment1


    visit "/questions/#{question.id}"
    expect(page).to have_content(comment.body)
    expect(page).to have_content(comment1.body)
  end

  scenario 'other answers do not appear' do
    question
    comment2

    visit "/questions/#{question.id}"
    expect(page).not_to have_content(comment2.body)
  end
end
