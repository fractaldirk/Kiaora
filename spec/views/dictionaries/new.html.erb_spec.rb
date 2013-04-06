require 'spec_helper'

describe "dictionaries/new" do
  before(:each) do
    assign(:dictionary, stub_model(Dictionary,
      :competency_english => "MyString"
    ).as_new_record)
  end

  it "renders new dictionary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dictionaries_path, :method => "post" do
      assert_select "input#dictionary_competency_english", :name => "dictionary[competency_english]"
    end
  end
end
