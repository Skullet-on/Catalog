require 'rails_helper'

RSpec.describe "automobiles/show", type: :view do
  before(:each) do
    @automobile = assign(:automobile, Automobile.create!(
      :brand => "Brand",
      :model => "Model",
      :modification => "Modification"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Modification/)
  end
end
