module ApplicationHelper
	def reviewUsername(a)
		User.find_by(id: a).first_name
	end
end
