get '/register' do 
  @user = User.new
  erb :'authentications/new'
end

post '/register' do 
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    erb :'authentications/new'
  end
end
