class PostsTag

  include ActiveModel::Model
  attr_accessor :title, :text, :image, :grade_id, :user_id

  with_options presence: true do
    validates :title
    validates :text
    validates :grade_id
  end

  def save
    post = Post.create(title: title, text: text, image: image, user_id: user_id)
    tag = Tag.where(grade_id: grade_id).first_or_initialize
    tag.save

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

end