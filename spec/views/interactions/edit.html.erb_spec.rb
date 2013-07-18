require 'spec_helper'

describe "interactions/edit" do
  before(:each) do
    @interaction = assign(:interaction, stub_model(Interaction))
  end

  it "renders the edit interaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", interaction_path(@interaction), "post" do
    end
  end
end
