class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :title, :content, :user_id
  attr_accessible :title, :content, :image
  validates_attachment :image, content_type: { content_type: /image/ }
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
end