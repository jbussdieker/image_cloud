module UserMacros
  module Controller
  end

  module Request
    def login(type = :user)
      FactoryGirl.create(type).tap do |user|
        login_as(user, :scope => :user, :run_callbacks => false)
      end
    end
  end
end

RSpec.configure do |config|
  config.include UserMacros::Controller, :type => :controller
  config.include UserMacros::Request, :type => :request
end
