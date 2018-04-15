FactoryBot.define do
  factory :tip do
    user
    title 'test'
    contents 'hoge'

    trait :published do
      status 1
    end

    trait :draft do
      status 0
    end
  end
end
