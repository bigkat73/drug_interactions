require 'spec_helper'

describe "medications/index" do
  before(:each) do
    assign(:medications, [
      stub_model(Medication,
        :nui => "Nui",
        :name => "Name"
      ),
      stub_model(Medication,
        :nui => "Nui",
        :name => "Name"
      )
    ])
  end

  it "renders a list of medications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nui".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
