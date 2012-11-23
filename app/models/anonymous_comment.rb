class AnonymousComment < Comment
  attr_accessible :nickname
  validates_presence_of :nickname
end
