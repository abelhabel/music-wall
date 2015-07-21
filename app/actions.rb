# Homepage (Root path
enable :sessions

get '/' do
  @messages = Message.all
  erb :index
end

post '/messages' do
  @messages = Message.all
  @message = Message.new(
    title: params[:title],
    author:  params[:author],
    url: params[:url] ,
    user_id: session[:user].id  
  )
  if @message.save
    redirect ''
  else
    erb :index
  end
end

post '/login' do
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
  cookies[:jsuser] = session[:user].username
  erb :index
end

post '/logout' do
  @messages = Message.all
  session[:user] = nil
  erb :index
end

post '/upvote' do
  if params[:id]
    message = Message.find(params[:id])
    message.votes = message.votes || 0
    message.votes += 1
    message.save
  end
end



