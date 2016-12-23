require 'rails_helper'

RSpec.describe "baby_names/edit", type: :view do
  before(:each) do
    @baby_name = assign(:baby_name, BabyName.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit baby_name form" do
    render

    assert_select "form[action=?][method=?]", baby_name_path(@baby_name), "post" do

      assert_select "input#baby_name_name[name=?]", "baby_name[name]"
    end
  end
end
