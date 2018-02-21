require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post=Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{post.id}"
  end

  delete '/posts/:id/delete' do
     post = Post.find(params[:id])
     post.destroy
     "#{post.name} was deleted"
  end

end





# First, create a route in your controller, get '/posts/new', that renders the new.erb view.
# We need to create an erb file in the views directory, new.erb, with a form that POSTs to a controller action, /posts.
# The controller action should use the Create CRUD action to create the blog post and save it to the database.
# Then, the action uses erb to render the index view page.
