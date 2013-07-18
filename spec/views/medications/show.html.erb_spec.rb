require 'spec_helper'

describe "medications/show" do
  before(:each) do
    @medication = assign(:medication, stub_model(Medication,
      :nui => "Nui",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nui/)
    rendered.should match(/Name/)
  end
end
