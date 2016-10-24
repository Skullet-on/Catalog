FactoryGirl.define do
  
  factory :automobile do
    brand "MyString"
		model "MyString"
		modification "MyString"
  end

  factory :invalid_automobile, class: Automobile do
    brand ""
		model ""
		modification ""
  end

end
