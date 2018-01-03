class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/songs' do
  	@songs = Song.all
    erb :index
  end

  get '/songs/new' do
  	erb :new
  end

  post '/songs' do
  	artist = Artist.find_or_create_by(params[:artist])
  	song_params = params[:song]
  	song_params['genres'] = params[:genres].collect do |genre|
  		Genre.find_or_create_by(name: genre)
  	end
  	song = artist.songs.create(song_params)
  	redirect "/songs/#{song.slug}"
  end

  get '/songs/:song' do
  	@song = Song.find_by_slug(params[:song])
  	erb :show
  end

end