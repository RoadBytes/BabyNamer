require 'rails_helper'

RSpec.describe "baby_names/show", type: :view do
  before(:each) do
    @baby_name = assign(:baby_name, BabyName.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
