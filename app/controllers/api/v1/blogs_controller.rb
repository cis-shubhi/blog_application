class Api::V1::BlogsController < ApplicationController
  def index
    @blogs = Post.all
    render json: @blogs
  end
  def create
    @blog = Blog.new(user_id: params[:user_id], description: params[:description], title: params[:title])
    if @blog.save
        render json: @blog
    else
        render json: {error: 'process not completed'}
    end
  end
  def update
    @blog = Blog.where(id: params[:id], user_id: session[:user_id]).first
    if @blog.update_attributes(description: params[:description], title: params[:title])
        render json: @blog
    else
        render json: {error: 'process not completed'}
    end
  end
  def destroy
    @blog = Blog.where(id: params[:id], user_id: session[:user_id]).first
    if @blog.destroy
        render json: {status: 'successful'}
    else
        render json: {error: 'process not completed'}
    end
  end
end
