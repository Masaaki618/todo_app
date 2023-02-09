FactoryBot.define do
  factory :user do
    name { 'name' }
    email { 'email@email' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
