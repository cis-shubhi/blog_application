class User < ActiveRecord::Base
   has_many :blogs
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User

end
