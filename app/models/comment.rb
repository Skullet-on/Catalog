class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :automobile
end
