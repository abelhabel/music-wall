# Homepage (Root path)
get '/' do
  @messages = Message.all
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

# get '/messages/:id' do
#   @message = Message.find params[:id]
#   @all_messages = Message.where("author = '#{@message.author}' AND id != #{@message.id}")
#   erb :'messages/show'
# end

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
    erb :''
  end
end