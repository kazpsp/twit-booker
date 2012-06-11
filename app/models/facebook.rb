class Facebook < ActiveRecord::Base
  validates_uniqueness_of :email
  attr_accessible :email, :fbid, :nombre
  has_many :comments
end
