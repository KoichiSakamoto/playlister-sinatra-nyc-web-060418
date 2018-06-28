require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :songs
  end


  get '/songs/new' do
    erb :new_song
  end

  post '/songs' do
    @artist = Artist.find_or_create(name: params[artist])
    @genre = Genre.find_or_create(name: params[genre])
    @song = Song.create(name: params[name], artist_id: @artist.id, genre_ids: @genre.id)
    binding.pry
    redirect "/songs"

  end

end
