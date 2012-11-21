class Comment < ActiveRecord::Base
  attr_accessible :message, :nickname
  validates :message, :nickname, presence: true
  belongs_to :post
end
