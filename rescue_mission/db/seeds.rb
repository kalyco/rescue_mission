if Rails.env.development?
  Question.find_or_create_by(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: 3)
  Question.find_or_create_by(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: 4)
  Question.find_or_create_by(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: 6)
  Question.find_or_create_by(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: 2)

  User.find_or_create_by(email: "example@example.com", encrypted_password: "password")
  User.find_or_create_by(email: "example1@example.com", encrypted_password: "password")
  User.find_or_create_by(email: "example2@example.com", encrypted_password: "password")
  User.find_or_create_by(email: "example3@example.com", encrypted_password: "password")

  Comment.find_or_create_by(body: "this is an answer", question_id: 1)
  Comment.find_or_create_by(body: "this is also an answer", question_id: 1)
  Comment.find_or_create_by(body: "this is an answer tooo", question_id: 3)
  Comment.find_or_create_by(body: "hi", question_id: 4)
  Comment.find_or_create_by(body: "sup", question_id: 5)
end
