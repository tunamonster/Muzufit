class CpostingsController < ApplicationController
	def show
		@cposting = Cposting.find(params[:id])
		@spots_left = @cposting.spots_left
	end

	def index
		@cpostings = Cposting.paginate(page: params[:page], :per_page => 5)
	end

	def new
		@cposting = Cposting.new
	end

	def create
		@cposting = Cposting.new(cposting_params)
		@cposting.user_id = current_user.id
		if @cposting.save
			flash[:success] = "Posting created!"
		redirect_to @cposting
		else
		flash.now[:error] = "error error error"
		end
	end


private 

	def cposting_params
		params.require(:cposting).permit(:content, :spots)
	end
end
