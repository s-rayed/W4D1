# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    artist: params[:artist],
    title: params[:title],
    url: params[:url]
    )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end
