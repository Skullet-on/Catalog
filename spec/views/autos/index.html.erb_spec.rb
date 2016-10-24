require 'rails_helper'

RSpec.describe "autos/index", type: :view do
  before(:each) do
    assign(:autos, [
      Auto.create!(
        :brand => "Brand",
        :model => "Model",
        :modification => "Modification"
      ),
      Auto.create!(
        :brand => "Brand",
        :model => "Model",
        :modification => "Modification"
      )
    ])
  end

  it "renders a list of autos" do
    render
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Modification".to_s, :count => 2
  end
end
