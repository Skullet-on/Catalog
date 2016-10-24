require 'rails_helper'

RSpec.describe "automobiles/index", type: :view do
  before(:each) do
    assign(:automobiles, [
      Automobile.create!(
        :brand => "Brand",
        :model => "Model",
        :modification => "Modification"
      ),
      Automobile.create!(
        :brand => "Brand",
        :model => "Model",
        :modification => "Modification"
      )
    ])
  end

  it "renders a list of automobiles" do
    render
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Modification".to_s, :count => 2
  end
end
