require 'spec_helper'

describe "interactions/index" do
  before(:each) do
    assign(:interactions, [
      stub_model(Interaction),
      stub_model(Interaction)
    ])
  end

  it "renders a list of interactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
