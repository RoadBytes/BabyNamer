require 'rails_helper'

RSpec.describe "baby_names/new", type: :view do
  before(:each) do
    assign(:baby_name, BabyName.new(
      :name => "MyString"
    ))
  end

  it "renders new baby_name form" do
    render

    assert_select "form[action=?][method=?]", baby_names_path, "post" do

      assert_select "input#baby_name_name[name=?]", "baby_name[name]"
    end
  end
end
