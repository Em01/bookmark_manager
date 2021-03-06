require 'sinatra'
require 'data_mapper'
require 'link'

env = ENV["RACK_ENV"] || "development"
#this checks what environment we are in, defaulting to development

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
#based on the enviornment we then select the database

require './lib/link' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!


get '/' do 
      erb :index
end

get '/' do 
  @links = Link.all
  erb :index
end
