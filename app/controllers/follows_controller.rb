class FollowsController < ApplicationController
  def show
    user = User.find(params[:id])
    @users1 = user.followings
  end
end
