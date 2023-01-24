FactoryBot.define do
  factory :task do
    name { Faker::Hipster.sentence(word_count: rand(3..7)) }
    association :creator, factory: :user
    association :assignee, factory: :user
    project
  end
end
