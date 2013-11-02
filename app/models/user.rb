class User < ActiveRecord::Base
  has_many :posts
  has_many :friends
  has_many :friend_requests, :uniq => true
  def self.from_email(email)
    return User.all.find_by email: email
  end
end
