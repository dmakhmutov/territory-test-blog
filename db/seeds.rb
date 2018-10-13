require 'ffaker'

100.times do
  Author.create(login: FFaker::Internet.email)
end

ips = 100.times.map { FFaker::Internet.ip_v4_address }
authors = Author.all

posts = begin
  arr = []
  200_000.times do |sequence|
    author = authors.sample
    post_hash = {
      title: FFaker::Lorem.word,
      body: FFaker::Lorem.sentence,
      author_id: author.id,
      author_login: author.login,
      author_ip: ips.sample,
      average_rating: (1..5).to_a.sample,
      lock_version: sequence
    }

    arr << post_hash
  end

  arr
end

::Post.import!(posts)
