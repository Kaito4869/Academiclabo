class TagsController < ApplicationController
  def index
    @tag = Tag.find(params[:post_id])
    @posts = @tag.posts.order('created_at DESC')
  end
end
