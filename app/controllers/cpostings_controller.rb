class CpostingsController < ApplicationController
	before_action :logged_in_user, only: [:show, :index, :create, :destroy, :edit, :new, :update, :destroy ]

	before_action :company_user?, only: [ 		  :create, :destroy, :edit, :new, :update, :destroy, :my_postings]

	def show
		@cposting = Cposting.find(params[:id])
		@spots_left = @cposting.spots_left
		@subscriptions = @cposting.subscriptions		
	end

	def index
			@cpostings = Cposting.paginate(page: params[:page], :per_page => 5)	
	end

	def company_posts
		@cpostings = Cposting.where(user_id: current_user.id)
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
	
		if @cposting.save
			flash[:success] = "Posting created!"
			redirect_to current_user
		else
			flash.now[:error] = "error error error"
			render 'new'
		end

	end


private 

    def company_user?
      redirect_to my_postings_path unless current_user.company
    end

    def customer_user?
      redirect_to cpostings_path unless current_user.company == false

    end

    def correct_company_user
    	redirect_to root_url unless Cposting.find_by(id: params[:id]).user = current_user
    end

	def cposting_params
		params.require(:cposting).permit(:content, :spots, :class_date, :class_time, :title)
	end
end
