class Stag < ApplicationRecord
  has_many :post_stag_relations
  has_many :posts, through: :post_stag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :subject

  validates :subject_id, numericality: { other_than: 1 }
end
