if Rails.env.development?
  Question.find_or_create_by(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: 1)
  Question.find_or_create_by(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: 2)
  Question.find_or_create_by(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: 2)
  Question.find_or_create_by(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: 3)

  User.find_or_create_by(id: 2, email: "example@example.com", encrypted_password: "password")
  User.find_or_create_by(id: 2, email: "example1@example.com", encrypted_password: "password")
  User.find_or_create_by(id: 3, email: "example2@example.com", encrypted_password: "password")
  User.find_or_create_by(id: 4, email: "example3@example.com", encrypted_password: "password")

  Answer.find_or_create_by(body: "this is an answer", question_id: 1)
  Answer.find_or_create_by(body: "this is also an answer", question_id: 1)
  Answer.find_or_create_by(body: "this is an answer tooo", question_id: 3)
  Answer.find_or_create_by(body: "hi", question_id: 4)
  Answer.find_or_create_by(body: "sup", question_id: 5)
end
