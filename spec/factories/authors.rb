FactoryBot.define do
  factory :author do
    login { FFaker::Internet.user_name }
  end
end
