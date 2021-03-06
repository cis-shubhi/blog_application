class Blog < ApplicationRecord
  belongs_to :user
  has_many :likes
  #mount_base64_uploader :image, ImageUploader

  acts_as_commentable

  def self.get_blog_detail
  	data = []
  	Blog.all.map do |blog|
      data << {title: blog.title, description: blog.description, id: blog.id, image: blog.image, 
      					created_at: blog.created_at, like_count: blog.likes.count, 
      					comments: blog.comments.map do |comment|
                	{id: comment.id, comment: comment.comment, created_by: comment.user.email,
                		created_at: comment.created_at}
                end
              }
 		end
 		return data
  end


  def get_blog_comments(blog)
    data = []
    blog.comments.map do |comment|
      data << {comment: comment.comment, created_at: comment.created_at, user: comment.user.email}
    end
    return data
  end
end
