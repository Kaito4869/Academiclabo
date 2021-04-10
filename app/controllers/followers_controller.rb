class FollowersController < ApplicationController
  def show
    user = User.find(params[:id])
    @users2 = user.followers
  end
end
