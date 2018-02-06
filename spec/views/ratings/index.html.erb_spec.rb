require 'rails_helper'

RSpec.describe "ratings/index", type: :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        :praxis => 2.5,
        :difficulty => 3.5,
        :homework => 4.5
      ),
      Rating.create!(
        :praxis => 2.5,
        :difficulty => 3.5,
        :homework => 4.5
      )
    ])
  end

  it "renders a list of ratings" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
  end
end
