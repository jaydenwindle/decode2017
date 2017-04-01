class CouponCodeController < ShopifyApp::AuthenticatedController

	def create
		discount = ShopifyAPI::Discount.new(
				{
						discount_type: "percentage",
						value: "100%",
						code: ,
						starts_at: Time.now,
						ends_at: 5.days.from_now,

				}
		)


	end

end
