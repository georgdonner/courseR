require 'rails_helper'

RSpec.describe "ratings/new", type: :view do
  before(:each) do
    assign(:rating, Rating.new(
      :praxis => 1.5,
      :difficulty => 1.5,
      :homework => 1.5
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input[name=?]", "rating[praxis]"

      assert_select "input[name=?]", "rating[difficulty]"

      assert_select "input[name=?]", "rating[homework]"
    end
  end
end
