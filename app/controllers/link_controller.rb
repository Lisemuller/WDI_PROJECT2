#Index

get '/links' do
  @files = File.all
  erb :'links/index'
end

#New
get '/links/new' do
  @file = File.new
  erb :'links/new'
end

#Create
post '/links' do
  @file = File.new(params[:file])
  if @file.save
    redirect "/links"
  else
    erb :'links/new'
  end
end

#Show
get '/links/:id' do
  @file = File.find(params[:id])
  if @file
    erb :'links/show'
  else
    redirect "/links"
  end
end

# EDIT
get "/links/:id/edit" do
  @file = File.find(params[:id])
  erb :"links/edit"
end

# UPDATE
put '/links/:id' do
  @file = File.find(params[:id])
  if @file.update(params[:file])
    redirect "/links/#{@file.id}"
  else
    erb :"links/show"
  end
end