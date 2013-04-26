require 'spec_helper'

describe "requests/new" do
  before(:each) do
    assign(:request, stub_model(Request,
      :request => "MyString",
      :user => "MyString",
      :office => 1,
      :status => 1
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => requests_path, :method => "post" do
      assert_select "input#request_request", :name => "request[request]"
      assert_select "input#request_user", :name => "request[user]"
      assert_select "input#request_office", :name => "request[office]"
      assert_select "input#request_status", :name => "request[status]"
    end
  end
end
