class UserController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end
end
