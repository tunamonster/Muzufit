class SubscriptionsController < ApplicationController
	before_action :customer_user, only: :create
	before_action :correct_user, only: :destroy
	def show
		@subscription = Subscription.find(params[:id])
	end

	def index
		@subscriptions = Subscription.where(subscriber_id: current_user.id)

	end

	def create 
		@cposting = Cposting.find(params[:post_id])	
		Subscription.where(post: @cposting.id, subscriber: current_user.id).create
		flash[:success] = "Subscribed!"
		redirect_to subscriptions_path
	end


	def destroy
	@subscription = Subscription.find_by_id(params[:id])
	if !@subscription.nil? 
		@subscription.destroy 
		flash[:success] = "Unsubscribed succesfully" 
	else
		flash[:error] = "Already unsubscribed!"
	end
		redirect_to subscriptions_path
	end

	private 
		def customer_user 
			redirect_to root_url unless current_user.company == false
		end
		
		def correct_user #checks if the accessed subscription belongs to current user
			@subscription = current_user.subscriptions.find_by(id: params[:id])
			redirect_to root_url if @subscription.nil?
		end

		
end
