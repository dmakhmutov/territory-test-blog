FactoryBot.define do
  factory :post do
    title { FFaker::Book.title}
    body { FFaker::Book.description }
    author_ip { FFaker::Internet.ip_v4_address }
    author_login { FFaker::Internet.user_name }
    author
  end
end
