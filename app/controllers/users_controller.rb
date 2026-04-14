class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.with_attached_image
  end
end