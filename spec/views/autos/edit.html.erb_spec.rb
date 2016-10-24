require 'rails_helper'

RSpec.describe "autos/edit", type: :view do
  before(:each) do
    @auto = assign(:auto, Auto.create!(
      :brand => "MyString",
      :model => "MyString",
      :modification => "MyString"
    ))
  end

  it "renders the edit auto form" do
    render

    assert_select "form[action=?][method=?]", auto_path(@auto), "post" do

      assert_select "input#auto_brand[name=?]", "auto[brand]"

      assert_select "input#auto_model[name=?]", "auto[model]"

      assert_select "input#auto_modification[name=?]", "auto[modification]"
    end
  end
end
