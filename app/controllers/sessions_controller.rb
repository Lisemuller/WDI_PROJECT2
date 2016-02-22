#get the login form
get '/login' do
  @user = User.new
  erb :"sessions/new"  
end

#handle the form
post '/login' do
  #find the user by their email address
  user = User.find_by_username(params[:user][:username])
  #if there is a user, check theur password is correct
  if user && user.authenticate(params[:user][:password])
    #log the user in
    session[:user_id] = user.id
    # flash[:success] = "Welcome!"
    redirect "/users/#{user.id}"
  else
  #otherwise render the login form again
  # flash[:danger] = "Username or Password incorrect"
  redirect "/login"
  end
end

#destroy the form
get '/logout' do
  session.clear
  puts session
  redirect "/login"
end