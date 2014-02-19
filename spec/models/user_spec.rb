require 'spec_helper'

describe User do
  it "should have valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
end
