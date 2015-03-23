class Comment < ActiveRecord::Base
  belongs_to :question

  validates :body,
  presence: true
  # length: { minimum: 50 }
  validates :question_id,
  presence: true
end
