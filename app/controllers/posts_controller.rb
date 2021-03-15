class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create, :search]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
    @tags = Tag.all.order('subject_id ASC')
  end

  def new
    @post = PostsTag.new
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    @post = PostsTag.new(post_params)
    if @post.valid? 
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @posts = Post.search(params[:title]).order('created_at DESC')
    @tags = Tag.all.order('subject_id ASC')
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @post.user
  end

  def post_params
    params.require(:posts_tag).permit(:title, :text, :image, :subject_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end