class TemplatesController < ApplicationController

	def new 
		@template = Template.new
	end

	def create
		@template = Template.new(template_params)
		@template.user = current_user #trying without id tags
		if @template.save
			flash.now[:success] = "#{@template.title} added!"
		else
			flash.now[:error] = "Error!"
		end
		render 'templates/index'
	end

	def show
		@template = Template.find(params[:id])
		#redirect_to root_url unless @template?
	end

	def index
		@template = Template.new
		@templates = current_user.templates
	end

	def edit
		@template = Template.find(params[:id])
	end

	def update
		@template = Template.find(params[:id])
		if @template.update_attributes(template_params)
			flash[:success] = "#{@template.title} updated!"
			render 'index'
		else
			flash[:error] = "Oops! Something went wrong"
			render 'edit'
		end
	end

	def destroy
		@template = Template.find(params[:id]).destroy
		flash[:success] = "#{@template.title} deleted!"
		redirect_to templates_url
	end

	private
		def template_params
			params.require(:template).permit(:title, :content, :picture)
		end
end
