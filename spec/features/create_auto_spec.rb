require 'rails_helper'

feature 'Create automobile' do
	scenario 'can Create automobile' do
		visit '/'
		click_link 'Create automobile'

		fill_in 'Brand', with: 'brand'
		fill_in 'Model', with: 'model'
		fill_in 'Modification', with: 'modification'

		click_button 'Create Auto'

		expect(page).to have_content('brand')
		expect(page).to have_content('model')
		expect(page).to have_content('modification')
	end
end