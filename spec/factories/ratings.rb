FactoryBot.define do
  factory :rating do
    login { (1..5).to_a.sample }
    post
  end
end
