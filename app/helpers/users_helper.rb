module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
  
  def count_approvings(user) 
		@count_approvings = user.approvings.count
  end
	
	def count_reviewings(user)
	  @count_reviewings = user.reviewings.count
	end
	
end
