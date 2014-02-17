require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :name => "Name",
        :longitude => "Longitude",
        :latitude => "Latitude"
      ),
      stub_model(Image,
        :name => "Name",
        :longitude => "Longitude",
        :latitude => "Latitude"
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
  end
end
