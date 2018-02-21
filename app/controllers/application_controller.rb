require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    # binding.pry
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
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
    # binding.pry
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end




end
