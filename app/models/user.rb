class User < ApplicationRecord
    belongs_to :giveaway

    def product_won
        return unless item_won
        ShopifyAPI::Product.find(item_won)
    end
end
