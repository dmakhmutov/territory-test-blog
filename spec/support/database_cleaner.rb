DatabaseCleaner[:active_record, connection: :test]

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, pre_count: true)
  end

  config.before do
    DatabaseCleaner[:active_record, connection: :test].strategy = :transaction
  end

  config.before(:each, truncation: true) do
    DatabaseCleaner.strategy = [:truncation, pre_count: true]
  end

  config.before do
    DatabaseCleaner.start
  end

  config.append_after do
    DatabaseCleaner.clean
  end
end
