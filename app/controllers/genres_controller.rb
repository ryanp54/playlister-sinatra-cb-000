class GenresController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/genres/") }

  get '/genres' do
  	@genres = Genre.all
    erb :index
  end

  get '/genres/:genre' do
  	@genre = Genre.find_by_slug(params[:genre])
  	erb :show
  end
  

end