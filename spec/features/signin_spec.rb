require 'rails_helper.rb'

feature "signing in" do
	let(:user) { create(:user) }

	def fill_in_signin_fields
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		click_button "Sign in"
	end

	scenario "Visiting the site to sign in" do
		visit root_path
		click_link "Login"
		fill_in_signin_fields
		expect(page).to have_content("Signed in successfully.")
	end
end