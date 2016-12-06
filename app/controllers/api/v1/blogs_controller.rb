class Api::V1::BlogsController < ApplicationController
  
  before_action :authenticate_api_v1_user!, except: [:index]

  def index
    @blogs = Post.all
    render json: @blogs
  end
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
        render json: @blog
    else
        render json: {error: 'process not completed'}
    end
  end
  def update
    @blog = Blog.where(id: params[:id], user_id: params[:user_id]).first
    if @blog.update_attributes(description: params[:description], title: params[:title])
        render json: @blog
    else
        render json: {error: 'process not completed'}
    end
  end
  def destroy
    @blog = Blog.where(id: params[:id], user_id: params[:user_id]).first
    if @blog.destroy
        render json: {status: 'successful'}
    else
        render json: {error: 'process not completed'}
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:user_id, :description, :title)
  end
end
