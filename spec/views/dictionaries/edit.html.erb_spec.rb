require 'spec_helper'

describe "dictionaries/edit" do
  before(:each) do
    @dictionary = assign(:dictionary, stub_model(Dictionary,
      :competency_english => "MyString"
    ))
  end

  it "renders the edit dictionary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dictionaries_path(@dictionary), :method => "post" do
      assert_select "input#dictionary_competency_english", :name => "dictionary[competency_english]"
    end
  end
end
