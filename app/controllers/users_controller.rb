class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
