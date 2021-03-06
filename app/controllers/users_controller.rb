#Index
# get '/users' do
#   @users = User.all
#   erb :'users/index'
# end

#New
# get '/users/new' do
#   @user = User.new
#   erb :'users/new'
# end

#Create
# post '/users' do
#   @user = User.new(params[:user])
#   if @user.save
#     redirect "/users"
#   else
#     erb :'users/new'
#   end
# end

#Show
get '/users/:id' do
  authorize!

  # if params[:id] != current_user.id
  #   redirect '/login'
  # end

   @user = User.find(params[:id])
   @allUsers = User.all

  if @user
    erb :'users/show'
  else
    redirect "/users"
  end
end

# EDIT
get "/users/:id/edit" do
  authorize!

  # if params[:id] != current_user.id
  #   redirect '/login'
  # end

  @user = current_user
  erb :"users/edit"
end

# UPDATE
put '/users/:id' do
  authorize!

  # if params[:id] != current_user.id
  #   redirect '/login'
  # end

  @user = current_user
  if @user.update(params[:user])
    redirect "/users/#{@user.id}"
  else
    erb :"users/show"
  end
end