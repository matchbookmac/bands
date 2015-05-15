require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

before do
  @all_bands = Band.all
  @all_venues = Venue.all
end
get '/' do
  erb :index
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
  end
end

get '/bands/:id' do
  @band = Band.find(params['id'])
  @venues = @band.venues
  @other_venues = @band.unplayed_venues
  erb :band
end

patch '/bands/:id/add/venue' do
  @band = Band.find(params['id'])
  added_venue_ids = params['venue_id']
  added_venue_ids.each do |venue_id|
    venue = Venue.find(venue_id)
    @band.venues.push(venue)
  end
  @venues = @band.venues
  redirect to "/bands/#{params['id']}"
end

patch '/bands/:id/update/name' do
  @band = Band.find(params['id'])
  @band.update(name: params['new_band_name'])
  @venues = @band.venues
  redirect to "/bands/#{params['id']}"
end

delete '/bands/:id/delete' do
  Band.find(params['id']).destroy
  redirect to '/bands'
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
  end
end

get '/venues/:id' do
  @venue = Venue.find(params['id'])
  @bands = @venue.bands
  @other_bands = @venue.unplayed_bands
  erb :venue
end

patch '/venues/:id/add/band' do
  @venue = Venue.find(params['id'])
  added_band_ids = params['band_id']
  added_band_ids.each do |band_id|
    band = Band.find(band_id)
    @venue.bands.push(band)
  end
  @venues = @venue.bands
  redirect to "/venues/#{params['id']}"
end

patch '/venues/:id/update/name' do
  @venue = Venue.find(params['id'])
  @venue.update(name: params['new_venue_name'])
  @venues = @venue.bands
  redirect to "/venues/#{params['id']}"
end
