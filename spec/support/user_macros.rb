module UserMacros
  module Controller
    def login(type = :user)
      FactoryGirl.create(type).tap do |user|
        sign_in user
      end
    end
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
  config.include UserMacros::Controller, :type => :view
  config.include UserMacros::Request, :type => :request
end
