require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do
    @posts = Post.find(params[:id])

    erb :show
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id/edit' do
    @posts = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    @posts = Post.find(params[:id])
    @posts.update(name: params[:name])
    @posts.update(content: params[:content])

    redirect to('posts/' + @posts.id)
  end

  delete '/posts/:id/delete' do
    @posts = Post.find(params[:id])
    @posts.delete

    erb :delete
  end

end
