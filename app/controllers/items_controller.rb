class ItemsController < ApplicationController

	def index
        @items = Item.all
    end

	def new
		@item = Item.new
	end
	
	def create
		item = Item.new(item_params)
		if item.save!
		  redirect_to :action => "index"
		else
		  redirect_to :action => "new"
		end
	end

	def show
		@item = Item.find(params[:id])
		@comments = @item.comments
        @comment = Comment.new
		
	end

	def edit
		@item = Item.find(params[:id])
	  end
	
	  def update
		item = Item.find(params[:id])
		if item.update(item_params)
		  redirect_to :action => "show", :id => tweet.id
		else
		  redirect_to :action => "new"
		end
	  end

	private
	def item_params
		params.require(:item).permit(:name, :about, :material, :image)
	end
end
