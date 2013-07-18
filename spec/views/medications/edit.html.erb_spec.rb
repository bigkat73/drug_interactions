require 'spec_helper'

describe "medications/edit" do
  before(:each) do
    @medication = assign(:medication, stub_model(Medication,
      :nui => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit medication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", medication_path(@medication), "post" do
      assert_select "input#medication_nui[name=?]", "medication[nui]"
      assert_select "input#medication_name[name=?]", "medication[name]"
    end
  end
end
