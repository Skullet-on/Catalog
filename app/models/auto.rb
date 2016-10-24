class Auto < ActiveRecord::Base
	validates :brand, :model, :modification, presence: true
end
