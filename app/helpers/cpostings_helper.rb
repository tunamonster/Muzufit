module CpostingsHelper
	def two_days(post)
		post.starts_at - DateTime.now > 178000
	end

end
