class GiveawaysController < ApplicationController
    def new
      products = ShopifyAPI::Product.find(:all, params: { limit: 250 })
      p products
    end
    
    def edit
    end

    def show
    end

    def update
    end

    def destroy
    end

    def create
    end
end
