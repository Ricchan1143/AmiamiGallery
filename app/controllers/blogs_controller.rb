class BlogsController < ApplicationController
	
	def index
        @blog = Blog.all
    end

	def new
		@blog = Blog.new
	end
	
	def create
		blog = Blog.new(blog_params)
		blog.user_id = current_user.id
		if blog.save!
		  redirect_to :action => "index"
		else
		  redirect_to :action => "new"
		end
	end

	def show
		@blog = Blog.find(params[:id])
	end
	
	private
	def blog_params
		params.require(:blog).permit(:title, :content, :image)
	end
end
