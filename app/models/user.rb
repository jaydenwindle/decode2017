class User < ApplicationRecord
    belongs_to :giveaway

    def product_won
        product = nil
        if item_won
            product = ShopifyAPI::Product.find(item_won)
        end

        product
    end
end
