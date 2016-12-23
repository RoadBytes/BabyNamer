require 'rails_helper'

RSpec.describe "baby_names/index", type: :view do
  before(:each) do
    assign(:baby_names, [
      BabyName.create!(
        :name => "Name"
      ),
      BabyName.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of baby_names" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
