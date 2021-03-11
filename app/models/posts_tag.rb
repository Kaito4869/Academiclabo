class PostsTag

  include ActiveModel::Model
  attr_accessor :text, :grade_id, :subject_id, :user_id

  with_options presence: true do
    validates :text
    validates :grade_id
    validates :subject_id
  end

  def save
    post = Post.create(text: text, user_id: user_id)
    tag = Tag.where(grade_id: grade_id, subject_id: subject_id).first_or_initialize
    tag.save

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

end