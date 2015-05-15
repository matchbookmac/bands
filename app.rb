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

get '/errors/:class/:id/:path' do
  object_class = params['class']
binding.pry
  erb :errors
end

get '/bands' do
  erb :bands
end

get '/bands/new' do
  erb :band_form
end

post '/bands/new' do
  band = Band.new(name: params['band_name'])
  if band.save
    redirect to '/bands'
  else
    @object_with_errors = band
    @path = '/bands/new'
    erb :errors
    # redirect to "/errors/#{@object_with_errors.class}/#{@object_with_errors.id}/#{@path}"
  end
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
    # redirect to "/errors/#{@object_with_errors}/#{@object_with_errors.id}/#{@path}"
  end
end
