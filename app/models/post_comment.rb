class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user, inverse_of: :comments
  has_ancestry

  validates :content, presence: true
end
