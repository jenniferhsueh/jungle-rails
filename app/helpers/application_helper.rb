module ApplicationHelper
  def review_user_first_name(a)
		User.find_by(id: a).first_name
	end

	def review_user_last_name(a)
		User.find_by(id: a).last_name
	end
end
