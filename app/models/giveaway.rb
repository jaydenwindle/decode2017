class Giveaway < ApplicationRecord
    has_many :users
    has_many :products
  
    def choose_winners   
      winners = {} 
      all_applicants = users.to_a.shuffle
      
      products.each do |product|
        product[:quantity].times { winners[all_applicants.pop] = product[:prod_id] }
      end
      
      winners
    end

    def get_coupon_code(quantity, product_id)
        @discount = ShopifyAPI::Discount.new(
            {
                discount_type: "percentage",
                value: "100",
                code: unique_id,
                usage_limit: quantity,
                applies_once_per_customer: true,
                applies_to_id: product_id,
                applies_to_resource: "product"
            }
        )
        p discount
        unique_id
    end

    def discount
        @discount
    end

    def save_discount
        !@discount.nil? && @discount.save
    end

    private
    def unique_id
        OpenSSL::Digest::SHA256.new((self.id * 2).to_s).to_s
    end
end
