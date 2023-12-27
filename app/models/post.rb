class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', inverse_of: :posts
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :post_likes, dependent: :destroy

  validates :title, presence: true, length: { in: 5..255 }
  validates :body, presence: true, length: { in: 200..4000 }
end
