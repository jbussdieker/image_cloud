RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Warden::Test::Helpers, :type => :request

  config.before(:each, type: :request) do
    Warden.test_mode!
  end

  config.after(:each, type: :request) do
    Warden.test_reset!
  end
end
