FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "userpassword"
    password_confirmation "userpassword"

    trait :admin do
      role :admin
    end
  end
end
