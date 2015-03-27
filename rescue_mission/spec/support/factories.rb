FactoryGirl.define do
  factory :question do
    title "I dont know how to tie my shoes :<"
    description "So there I was, totally ready to get my shoes all kinds of tied,
  when I realized that I have completely forgotten how to do anything even
    remotely tie-like. wat do?"
    id 1
    user_id 2
    factory :question1 do
      title "forgt hw too spel"
      description "cnt spel anymoor. donuwut to du. halp?"
      id 2
    end
  end

  FactoryGirl.define do
    factory :answer do
      body "Build a tee pee
      Come inside
      Close it tight so we can hide
      Over the mountain
      And around we go
      Here's my arrow
      And here's my bow!"
      question_id 1
    factory :answer1 do
      body "Bunny ears,
       Bunny ears, playing by a tree.
       Criss-crossed the tree,
       trying to catch me.
       Bunny ears, Bunny ears,
       jumped into the hole,
       Popped out the other side beautiful and bold."
      question_id 1
    factory :asnwer2 do
      body "read the google"
      question_id 2
        end
      end
    end
  end
end
