require 'spec_helper'

describe "positions/edit" do
  before(:each) do
    @position = assign(:position, stub_model(Position,
      :job_title => "MyString"
    ))
  end

  it "renders the edit position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => positions_path(@position), :method => "post" do
      assert_select "input#position_job_title", :name => "position[job_title]"
    end
  end
end
