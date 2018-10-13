FactoryBot.define do
  factory :post do
    title { FFaker::Book.title}
    body { FFaker::Book.description }
    author_ip { FFaker::Internet.ip_v4_address }
    author
  end
end
