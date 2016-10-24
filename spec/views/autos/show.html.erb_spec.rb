require 'rails_helper'

RSpec.describe "autos/show", type: :view do
  before(:each) do
    @auto = assign(:auto, Auto.create!(
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
