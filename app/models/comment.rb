class Comment < ActiveRecord::Base
  attr_accessible :comment, :idusuario
  belongs_to :facebook
end
