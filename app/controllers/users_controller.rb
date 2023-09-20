class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:likes]

def likes
    likes = Like.where(user_id: @user.id).pluck(:item_id)
    @liked_item = item.find(likes)
end

def destroy
    @user = User.find(params[:id])
    @user.destroy
    sign_out @user
    flash[:notice] = "アカウントが削除されました。"
    redirect_to root_path
  end 
  
private
	def set_user
		@user = User.find(params[:id])
	end
end