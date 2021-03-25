FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    grade_id {6}
    name {'田中太郎'}
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
  end
end
