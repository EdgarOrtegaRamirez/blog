class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  validates_uniqueness_of :user_id, scope: :comment_id

  scope :user_like, lambda {|user_id| where(:user_id => user_id) }
end
