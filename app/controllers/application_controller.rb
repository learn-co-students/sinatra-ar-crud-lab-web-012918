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
    # binding.pry
    Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  get '/posts' do
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    # binding.pry
    post = Post.find_by(id: params[:id])
    @post = post.update(name: params[:name], content: params[:content])
    erb :show
  end

  get '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  delete '/posts/:id' do
    # binding.pry
    post = Post.find_by(id: params[:id])
    post.destroy
    "#{post.name} was deleted"
    # erb :index
  end
end
