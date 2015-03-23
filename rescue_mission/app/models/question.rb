class Question < ActiveRecord::Base
  has_many :comments, through: :user
  belongs_to :user

  validates :user_id, presence: :true
  validates :title,
  presence: true,
  uniqueness: true
  # length: { minimum: 40 }
  validates :description,
  presence: true
  # length: {minimum: 150 }
end
