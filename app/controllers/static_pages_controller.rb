class StaticPagesController < ApplicationController

	def home
	@user=User.new #enabling signup and login form on static pages
    if !current_user.nil?
        redirect_to current_user
    end
    @email = Signup.new #landing page emails 
	end

   
    def FAQ
        end

end
