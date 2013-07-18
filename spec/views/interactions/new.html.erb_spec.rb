require 'spec_helper'

describe "interactions/new" do
  before(:each) do
    assign(:interaction, stub_model(Interaction).as_new_record)
  end

  it "renders new interaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", interactions_path, "post" do
    end
  end
end
