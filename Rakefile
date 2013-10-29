require 'sinatra/activerecord/rake'
require './app'

namespace :db do
  desc "create the postgres database"
  task :create do
    `createdb social_network`
  end

  desc "drop the postgres database"
  task :drop do
    `dropdb social_network`
  end
end
