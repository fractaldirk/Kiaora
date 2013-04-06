require 'spec_helper'

describe "dictionaries/index" do
  before(:each) do
    assign(:dictionaries, [
      stub_model(Dictionary,
        :competency_english => "Competency English"
      ),
      stub_model(Dictionary,
        :competency_english => "Competency English"
      )
    ])
  end

  it "renders a list of dictionaries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Competency English".to_s, :count => 2
  end
end
