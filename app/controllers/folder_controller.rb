#Index

get '/folders' do
  authorize!
  @folders = current_user.folders
  erb :'folders/index'
end

#New
get '/folders/new' do
  authorize!
  @folder = Folder.new
  erb :'folders/new'
end

#Create
post '/folders' do
  authorize!
  @folder = Folder.new(params[:folder])
  if @folder.save
    @folder.users << current_user if !@folder.users.include? current_user
    redirect "/folders/#{@folder.id}"
  else
    erb :'folders/new'
  end
end

#Show
get '/folders/:id' do
  authorize!
  @folder = Folder.find(params[:id])
  if @folder.users.include? current_user
    erb :'folders/show'
  else
    redirect "/folders"
  end
end

# EDIT
get "/folders/:id/edit" do
  authorize!
  @folder = Folder.find(params[:id])

  if @folder.users.include? current_user
    erb :"folders/edit"
  else
    redirect "/folders"
  end
end

# UPDATE
put '/folders/:id' do
  authorize!
  @folder = Folder.find(params[:id])

  if @folder.users.include? current_user && @folder.update(params[:folder])
    redirect "/folders/#{@folder.id}"
  else
    erb :"folders/show"
  end
end
