class Tag < ApplicationRecord
  has_many :post_tag_relations
  has_many :posts, through: :post_tag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :subject

  validates :subject_id, numericality: { other_than: 1 }
end
