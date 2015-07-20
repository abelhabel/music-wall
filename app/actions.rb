# Homepage (Root path
enable :sessions

get '/' do
  @messages = Message.all
  @existing_user = @current_user
  erb :index
end

post '/messages' do
  @messages = Message.all
  @message = Message.new(
    title: params[:title],
    author:  params[:author],
    url: params[:url]   
  )
  if @message.save
    redirect ''
  else
    erb :index
  end
end

post '/login_logout' do
  @messages = Message.all
  @existing_user = User.find_by( user_name: params[:user_name] )
  # @existing_user = @existing_user ? 'true' : 'false'
  if @existing_user 
    if @existing_user.password == params[:password]
      session[:user] = @existing_user
    end
  else
    session[:user] = User.create( user_name: params[:user_name], password: params[:password] )
  end
  erb :index
end