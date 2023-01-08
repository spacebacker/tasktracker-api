FactoryBot.define do
  factory :project do
    user
    name { Faker::Fantasy::Tolkien.poem }
  end
end
