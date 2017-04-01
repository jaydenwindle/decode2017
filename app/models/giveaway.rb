class Giveaway < ApplicationRecord
    has_many :users
    has_many :products
  
    def choose_winners   
      winners = {} 
      users = 1.upto(100).to_a
      all_applicants = users.to_a.shuffle
      
      JSON.parse(products).each do |product_id, quantity|
        quantity.times { winners[all_applicants.pop] = product_id }
      end
      
      winners
    end

    def get_coupon_code(quantity, product_id)
        discount = ShopifyAPI::Discount.new(
            {
                discount_type: "percentage",
                value: "100%",
                code: unique_id,
                usage_limit: quantity,
                applies_once_per_customer: true,
                times_used: quantity,
                applies_to_id: product_id,
                applies_to_resource: "product"

            }
        )
        unique_id
    end

    private
    def unique_id
        OpenSSL::Digest::SHA256.new((self.id * 2).to_s)
    end
end
