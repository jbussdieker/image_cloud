require 'spec_helper'

describe "images/show" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :name => "Name",
      :longitude => "Longitude",
      :latitude => "Latitude"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Longitude/)
    rendered.should match(/Latitude/)
  end
end
