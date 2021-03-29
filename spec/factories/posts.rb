FactoryBot.define do
  factory :post do
    title {'二次関数'}
    text {'二次関数がわかりません。'}
    association :user
  end
end
