class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @users1 = user.followings
    @users2 = user.followers
    @post = Post.find(params[:id])
  end
end
