RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl::SyntaxRunner.include(ActionDispatch::TestProcess)
