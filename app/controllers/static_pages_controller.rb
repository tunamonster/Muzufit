class StaticPagesController < ApplicationController

	def home
	@user=User.new #enabling signup and login form on static pages
    if !current_user.nil?
        render 'users/show'
    end
	end

   
    def FAQ
        end

end
