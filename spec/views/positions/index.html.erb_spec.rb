require 'spec_helper'

describe "positions/index" do
  before(:each) do
    assign(:positions, [
      stub_model(Position,
        :job_title => "Job Title"
      ),
      stub_model(Position,
        :job_title => "Job Title"
      )
    ])
  end

  it "renders a list of positions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Job Title".to_s, :count => 2
  end
end
