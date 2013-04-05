require 'spec_helper'

describe "positions/show" do
  before(:each) do
    @position = assign(:position, stub_model(Position,
      :job_title => "Job Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Job Title/)
  end
end
