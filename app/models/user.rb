class User < ApplicationRecord

	before_save {
		u = User.find_by(email: self.email)
		raise Exception.new("Sorry, this email #{self.email} has already been registered.") if u
	}

end
