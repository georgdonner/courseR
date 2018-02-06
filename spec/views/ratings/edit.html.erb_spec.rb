require 'rails_helper'

RSpec.describe "ratings/edit", type: :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :praxis => 1.5,
      :difficulty => 1.5,
      :homework => 1.5
    ))
  end

  it "renders the edit rating form" do
    render

    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do

      assert_select "input[name=?]", "rating[praxis]"

      assert_select "input[name=?]", "rating[difficulty]"

      assert_select "input[name=?]", "rating[homework]"
    end
  end
end
