class Giveaway < ApplicationRecord
    has_and_belongs_to_many :user
    has_and_belongs_to_many :product


    def get_coupon_code(quantity)
        discount = ShopifyAPI::Discount.new(
            {
                discount_type: "percentage",
                value: "100%",
                code: unique_id,
                usage_limit: quantity,
                applies_once_per_customer: true,
                times_used: quantity
            }
        )
        unique_id
    end

    private
    def unique_id
        OpenSSL::Digest::SHA256.new((self.id * 2).to_s)
    end
end
