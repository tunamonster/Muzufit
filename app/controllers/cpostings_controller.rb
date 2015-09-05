class CpostingsController < ApplicationController
	before_action :company_user, only: [:create, :new ]

	before_action :correct_user, only: [:destroy, :edit, :update, :my_postings]

	def show
		@cposting = Cposting.find(params[:id])
		@spots_left = @cposting.spots_left
		@subscriptions = @cposting.subscriptions	
		@template = current_user.templates.find_by_content(@cposting.content) 
		@cpostings = Cposting.where(content: @cposting.content) 
		@nucpostings = @cpostings.where.not(id: @cposting.id) #combine this + above in 1 var
	end

	def index
			@cpostings = Cposting.paginate(page: params[:page], :per_page => 5)
	end

	def company_posts
		@cpostings = current_user.cpostings 
	end

	def search
		@search_results = PgSearch.multisearch(params[:query]).paginate(page: params[:page], :per_page => 5)
	end

	def new
		@cposting = Cposting.new
		@templates = current_user.templates

	end

	def create
	@cposting = Cposting.new(cposting_params)
	@cposting.user_id = current_user.id
	@templates = current_user.templates
		if @cposting.save
			flash[:success] = "Posting created!"
			redirect_to current_user
		else
			flash.now[:error] = "error error error"
			render 'new'
		end

	end

	def edit
		#@cposting = Cposting.find_by(params[:id])
	end

private

	def company_user
		redirect_to root_url unless current_user.company
	end

	def correct_user
		redirect_to root_url unless Cposting.find(params[:id]).user == current_user
	end

	def cposting_params
		params.require(:cposting).permit(:content, :spots, :class_date, :class_time, :title, :picture)
	end
end
