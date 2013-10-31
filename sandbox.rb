require 'sinatra'
require 'active_record'
require 'sinatra/flash'
require_relative './app/models/user'
require_relative './app/models/post'
require_relative './app/models/friend'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'social_network')

set :session_secret, ENV["SESSION_KEY"] || 'too secret'

enable :sessions

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

# p Friend.all.first

@feed_owner = Friend.all.find(1)

Friend.all.each do |friend|
  if friend.user_id == @feed_owner.id
    friend.email
  end
end


User.find(Friend.all.first.friend_id).email