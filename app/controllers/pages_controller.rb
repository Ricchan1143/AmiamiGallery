class PagesController < ApplicationController

	def about
	end

	def index
        @items = Item.all
    end
end
