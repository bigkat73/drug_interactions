require 'spec_helper'

describe "medications/new" do
  before(:each) do
    assign(:medication, stub_model(Medication,
      :nui => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new medication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", medications_path, "post" do
      assert_select "input#medication_nui[name=?]", "medication[nui]"
      assert_select "input#medication_name[name=?]", "medication[name]"
    end
  end
end
