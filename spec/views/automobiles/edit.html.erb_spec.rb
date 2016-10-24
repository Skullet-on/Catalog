require 'rails_helper'

RSpec.describe "automobiles/edit", type: :view do
  before(:each) do
    @automobile = assign(:automobile, Automobile.create!(
      :brand => "MyString",
      :model => "MyString",
      :modification => "MyString"
    ))
  end

  it "renders the edit automobile form" do
    render

    assert_select "form[action=?][method=?]", automobile_path(@automobile), "post" do

      assert_select "input#automobile_brand[name=?]", "automobile[brand]"

      assert_select "input#automobile_model[name=?]", "automobile[model]"

      assert_select "input#automobile_modification[name=?]", "automobile[modification]"
    end
  end
end
