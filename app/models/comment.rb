class Comment < ActiveRecord::Base
  attr_accessible :message
  belongs_to :post
  has_many :likes
  validates_presence_of :message
end
