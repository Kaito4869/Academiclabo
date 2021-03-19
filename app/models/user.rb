class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade

  with_options presence: true do
    validates :nickname, length: { maximum: 6 }
    validates :grade_id, numericality: { other_than: 1 }
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :email
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end
end
