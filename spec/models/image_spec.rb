require 'spec_helper'

describe Image do
  it "should have valid factory" do
    FactoryGirl.create(:image).should be_valid
  end
end
