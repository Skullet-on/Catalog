FactoryGirl.define do

	factory :auto do
		brand "Audi"
		model "A8"
		modification "Audi A8 D4"
	end

	factory :invalid_auto, class: Auto do
		brand ""
		model ""
		modification ""
	end

end