#Index

get '/users/:id' do
  @folder = Folder.all
  erb :'folders/index'
end

#New
get '/folder/new' do
  @folder = Folder.new
  erb :'folders/new'
end

#Create
post '/users/:id' do
  @folder = Folder.new(params[:folder])
  if @folder.save
    redirect "/users/:id"
  else
    erb :'folders/new'
  end
end

#Show
get '/folder/:id' do
  @folder = Folder.find(params[:id])
  if @folder
    erb :'folders/show'
  else
    redirect "/folder"
  end
end

# EDIT
get "/folders/:id/edit" do
  @folder = Folder.find(params[:id])
  erb :"folders/edit"
end

# UPDATE
put '/folders/:id' do
  @folder = Folder.find(params[:id])
  if @folder.update(params[:folder])
    redirect "/folder/#{@folder.id}"
  else
    erb :"folders/show"
  end
end
