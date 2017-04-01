class CouponCodeController < ShopifyApp::AuthenticatedController
	include CouponCodeHelper

	def create
		discount = ShopifyAPI::Discount.new(
				{
						discount_type: "percentage",
						value: "100%",
						code: hash_coupon(params[:id]),
						starts_at: Time.now,
						ends_at: 5.days.from_now,
						usage_limit: 1,
						applies_once: true,
						applies_once_per_customer: true,
						times_used: 1
				}
		)


	end

end
