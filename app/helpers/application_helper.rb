module ApplicationHelper
		def home

	end
	def sidebarGenerated
	    'class="sidebarActive"' if controller_name == "cpostings" || 'subscriptions' || 'users'
	end

end
