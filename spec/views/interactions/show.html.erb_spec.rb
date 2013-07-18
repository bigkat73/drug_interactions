require 'spec_helper'

describe "interactions/show" do
  before(:each) do
    @interaction = assign(:interaction, stub_model(Interaction))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
