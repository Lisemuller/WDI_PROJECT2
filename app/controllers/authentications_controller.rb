get '/register' do 
  @User = User.new
  erb :'authentications/new'
end