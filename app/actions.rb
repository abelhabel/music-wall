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
    user = User.new( user_name: params[:user_name], password: params[:password] )
    if user.save
      session[:user] = user
    else
      session[:user] = nil
      @login_failure_message = "Both user name and password have to be provided."
    end
  end
  erb :index
end

post '/logout' do
  @messages = Message.all
  session[:user] = nil
  erb :index
end

post '/upvote' do
  if params[:message_id]
    message = Message.find(params[:message_id])
    vote_record = Upvote.exists?(user_id: session[:user].id, message_id: params[:message_id])

    if !vote_record
      Upvote.create(user_id: session[:user].id, message_id: params[:message_id])
      erb :upvote_success, :layout => false
    else
      erb :upvote_fail, :layout => false
    end
  end
end

post '/reviews' do
  @messages = Message.all
  # session[:test] = params['content']
  review_exist = Review.exists?(user_id: session[:user].id, message_id: params[:message_id])
  if !review_exist
    Review.create(user_id: session[:user].id, message_id: params[:message_id], content: params[:content])
  end
  redirect '/'
  erb :index
end

post '/remove_review' do
  Review.destroy(params[:review_id])
  redirect '/'
  erb :index
end












