require 'rails_helper'

RSpec.describe "automobiles/new", type: :view do
  before(:each) do
    assign(:automobile, Automobile.new(
      :brand => "MyString",
      :model => "MyString",
      :modification => "MyString"
    ))
  end

  it "renders new automobile form" do
    render

    assert_select "form[action=?][method=?]", automobiles_path, "post" do

      assert_select "input#automobile_brand[name=?]", "automobile[brand]"

      assert_select "input#automobile_model[name=?]", "automobile[model]"

      assert_select "input#automobile_modification[name=?]", "automobile[modification]"
    end
  end
end
