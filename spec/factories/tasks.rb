FactoryBot.define do
  factory :task do
    name { 'name' }
    description { 'description' }
    association :user
  end
end
