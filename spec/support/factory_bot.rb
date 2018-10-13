FactoryBot::SyntaxRunner.class_eval do
  include RSpec::Mocks::ExampleMethods
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
