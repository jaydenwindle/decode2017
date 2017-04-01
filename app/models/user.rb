class User < ApplicationRecord
    has_and_belongs_to_many :giveaway

	before_save {
		u = User.find_by(email: self.email)
		raise Exception.new("Sorry, this email #{self.email} has already been registered.") if u
	}

end
