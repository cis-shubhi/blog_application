class Api::V1::BlogsController < ApplicationController

  before_action :find_blog, except: :index
  
  def index
    @blogs = Blog.all
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
    if @blog.update_attributes(description: params[:description], title: params[:title])
        render json: @blog
    else
        render json: {error: 'process not completed'}
    end
  end
  def destroy
    if @blog.destroy
        render json: {status: 'successful'}
    else
        render json: {error: 'process not completed'}
    end
  end
  def post_comments
    @blog.comments.where(comment: params[:comment], title: params[:title], user_id: params[:user_id]).first_or_initialize
    @blog.save
  end
  def get_comments
    @blog.comments
  end

  private

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:user_id, :description, :title, :image)
  end
end
