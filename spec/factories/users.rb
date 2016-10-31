FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
		password { Devise.friendly_token.first(8) }
    admin false
  end

  factory :admin, class: User do
    email { FFaker::Internet.email }
    password { Devise.friendly_token.first(8) }
    admin true
  end

  factory :invalid_user, class: User do
    email ""
		password ""
  end

end
