class SaltController < ApplicationController
	def candy1
	@visits= [0,0,0,0,0]
    #@visits.delete_at(0) if session[:history].size >= 5
    @visits << request.url
	end

	def candy2
	@visits= [0,0,0,0,0]
    #@visits.delete_at(0) if session[:history].size >= 5
    @visits << request.url
	end
end
