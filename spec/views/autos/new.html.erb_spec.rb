require 'rails_helper'

RSpec.describe "autos/new", type: :view do
  before(:each) do
    assign(:auto, Auto.new(
      :brand => "MyString",
      :model => "MyString",
      :modification => "MyString"
    ))
  end

  it "renders new auto form" do
    render

    assert_select "form[action=?][method=?]", autos_path, "post" do

      assert_select "input#auto_brand[name=?]", "auto[brand]"

      assert_select "input#auto_model[name=?]", "auto[model]"

      assert_select "input#auto_modification[name=?]", "auto[modification]"
    end
  end
end
