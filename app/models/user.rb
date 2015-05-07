class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts
    mount_uploader :avatar, AvatarUploader
  has_many :favorites, dependent: :destroy

  has_many :comments
  has_many :votes, dependent: :destroy


  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  # takes a post object and returns a favorite object if one exists
  #  allow us to toggle favorite / unfavorite links
  def favorited(post)
     favorites.where(post_id: post.id).first
   end

  def voted(post)
    votes.where(post_id: post.id).first
  end

end
