require 'sinatra'
require 'active_record'
require_relative './app/models/elephant'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'sinatra_skeleton_dev')

get '/' do
  erb :index
end

post '/' do
  erb :sign_in
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  # User.create(:email => params[:email], :password => params[:password])
  erb :confirm_new_user
end