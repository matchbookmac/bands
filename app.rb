require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

before do
  @bands = Band.all
  @venues = Venue.all
end
get '/' do
  erb :index
end

get '/errors/:class/:id' do

end

get '/bands' do
  erb :bands
end

get '/venues' do
  erb :venues
end

get '/venues/new' do
  erb :venue_form
end

post '/venues/new' do
  venue = Venue.new(name: params['venue_name'], location: params['venue_location'])
  if venue.save
    redirect to '/venues'
  else
    @object_with_errors = venue
    @path = '/venues/new'
    erb :errors
    # redirect to "/errors/#{@object_with_errors.class}/#{@object_with_errors.id}"
  end
end
