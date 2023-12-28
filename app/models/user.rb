class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :email, uniqueness: true
  has_many :posts, foreign_key: 'creator_id', inverse_of: :creator, dependent: :destroy
  # has_many :post_comments, foreign_key: 'creator_id', inverse_of: :creator, dependent: :destroy
  # has_many :post_likes, dependent: :destroy
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
end
