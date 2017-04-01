module GiveawaysHelper

	def hash_coupon(user_id)
		email_address = get_email_address(user_id)
		do_hash(email_address)
	end

	def matches(coupon_hash, user_id)
		email_address = get_email_address(user_id)
		coupon_hash = do_hash(email_address)
		coupon_hash == user_id
	end

	def get_email_address(user_id)
		user = User.find_by id: user_id
		return nil if user.nil?
		email_address = user.email
		return nil if !email_address
		email_address
	end

	def do_hash(email_address)
		code = OpenSSH::Digest::SHA256.new(email_address)
		code = OpenSSH::Digest::SHA256.new(code)
	end

end
