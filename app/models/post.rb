class Post < ApplicationRecord 

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
  belongs_to :Subject

  validates :text, presence: true
  validates :grade_id, numericality: { other_than: 1 } 
  validates :subject_id, numericality: { other_than: 1 } 
end