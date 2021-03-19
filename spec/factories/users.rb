FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    occupation {'高校2年生'}
    name {'田中太郎'}
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
  end
end
