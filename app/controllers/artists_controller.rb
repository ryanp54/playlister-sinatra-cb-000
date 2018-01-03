class ArtistsController < Sinatra::Base
	set :views, Proc.new { File.join(root, "../views/artists/") }
	 
  get '/artists' do
  	@artists = Artist.all
    erb :index
  end

  get '/artists/:artist' do
  	@artist = Artist.find_by_slug(params[:artist])
  	erb :show
  end

end