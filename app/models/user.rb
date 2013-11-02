class User < ActiveRecord::Base
  validates :email, presence: true
  validates :name, presence: true
  validates :hex_digest, presence: true
  has_many :posts
  has_many :friends
  has_many :friend_requests, :uniq => true
  def self.from_email(email)
    return User.all.find_by email: email
  end
end
