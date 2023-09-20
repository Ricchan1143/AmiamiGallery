class FavoritesController < ApplicationController
	before_action :set_item
	before_action :authenticate_user!

	def create
		favorite = current_user.favorites.create(item_id: params[:item_id]) 
		redirect_back(fallback_location: root_path)
	end
	
	def destroy
		favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
		favorite.destroy
		redirect_back(fallback_location: root_path)
	end
	
	private
	def set_item
		@item = Item.find(params[:item_id])
	end
	def index
end
