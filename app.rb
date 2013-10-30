require 'sinatra'
require 'active_record'
require_relative './app/models/user'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'social_network')

set :session_secret, ENV["SESSION_KEY"] || 'too secret'

enable :sessions

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/' do
  erb :index, :locals => { :session => session }
end

post '/' do
  curr_user = User.find_by email: params[:email]
  if !curr_user || curr_user.password != params[:password]
    erb :login_failed
  elsif curr_user.password != params[:password]
    erb :login_failed
  else
    session[:email] = params[:email]
    erb :sign_in
  end
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  User.create(:email => params[:email], :password => params[:password])
  erb :confirm_new_user
end

get '/logout' do 
  session.clear
  redirect '/'
end
get '/:page_id' do
  @feed_owner = User.find(params[:page_id])
  halt 404 unless @feed_owner
  # ideally make this page display form and content if and only 
  # if owner is logged in, otherwise display content only. May
  # need to accomplish this using two separate views.
  erb :user_feed
end

post '/:page_id' do
  # add something to authenticate that user is owner in order to post
  Post.create(:title => params[:title], :body => params[:body],
           :user_id => params[:page_id])
  erb :user_feed
end
