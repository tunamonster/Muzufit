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

	def index
		@template = Template.new
		@templates = current_user.templates
	end

	private
		def template_params
			params.require(:template).permit(:title, :content)
		end
end
