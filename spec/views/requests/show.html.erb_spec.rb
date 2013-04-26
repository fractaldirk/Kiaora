require 'spec_helper'

describe "requests/show" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :request => "Request",
      :user => "User",
      :office => 1,
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Request/)
    rendered.should match(/User/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
