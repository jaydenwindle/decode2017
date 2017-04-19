class Giveaway < ApplicationRecord
    has_many :users
    has_many :products
  
    def choose_winners   
      all_applicants = users.to_a.shuffle
      
      products.each do |product|
        product[:quantity].times do
            w = all_applicants.pop
            if !w 
                return 
            else
                w.item_won = product[:prod_id]
                w.save
            end
        end
      end
    end

    def winners 
        users.where("item_won <> ''")
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
