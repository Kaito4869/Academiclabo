class Post < ApplicationRecord 

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy

  validates :text, presence: true 
end