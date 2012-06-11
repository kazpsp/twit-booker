class Comment < ActiveRecord::Base
  attr_accessible :comment, :facebook_id
  belongs_to :facebook
end
