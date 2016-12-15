class Api::V1::BlogsController < ApplicationController

  before_action :find_blog, except: [:index, :create]
  
  def index
    data = []
    Blog.all.map do |blog|
      data << {title: blog.title, description: blog.description, id: blog.id, created_at: blog.created_at,
                like_count: blog.likes.count, comments: blog.comments.map do |comment|
                  {id: comment.id, comment: comment.comment, created_by: comment.user.email, created_at: comment.created_at}
                end
              }
 
    end
    render json: data
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
  def get_comments
    render json: @blog.comments
  end
  def post_comments
    @blog.comments.new(comment: params[:comment], title: params[:title], user_id: params[:user_id])
    if @blog.save
        render json: {status: 'successful', comment: @blog.comments.last}
    else
        render json: {error: 'process not completed'}
    end
  end
  def edit_comment
    @comment = Comment.find(params[:id])
    if @comment.update_column('comment', params[:comment])
        render json: {status: 'successful', comment: @comment}
    else
        render json: {error: 'process not completed'}
    end
  end
  def delete_comment
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: {status: 'successful'}
  end
  def create_likes
    @blog.likes.where(status: params[:status], user_id: params[:user_id]).first_or_initialize
    if @blog.save
        render json: {status: 'successful', comment: @blog.likes.last}
    else
        render json: {error: 'process not completed'}
    end
  end


  private

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:user_id, :description, :title, :image)
  end
end
