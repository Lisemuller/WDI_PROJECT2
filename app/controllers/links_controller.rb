# Index
get '/links' do
  @links = Link.all
  erb :'links/index'
end

# New
get '/links/new' do
  @link = Link.new
  erb :'links/new'
end


# Create
post '/links' do
  @link = Link.new(params[:link])
  if @link.save
    
    redirect "/links"
  else
    erb :'links/new'
  end
end


