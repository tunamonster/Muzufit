class SubscriptionsController < ApplicationController
	def show
		@subscription = Subscription.find(params[:id])
	end

	def index
		@subscriptions = Subscription.where(subscriber_id: current_user.id)

	end

	def create
		@posting = Cposting.find(params[:post_id])	
		current_user.subscriptions.create(post_id: @posting.id)
		flash[:success] = "Subscribed!"
		redirect_to subscriptions_path
	end

	def destroy 		
		@subscription = Subscription.find(params[:id])	
		@subscription.destroy
		flash[:success] = "Unsubscribed succesfully" #from cposting.title
		redirect_to subscriptions_path
	end
end
