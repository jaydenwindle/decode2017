class GiveawaysController < ApplicationController
    def new
      products = ShopifyAPI::Product.find(:all, params: { limit: 250 })
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
      storeID = ShopifyAPI::Shop.current.id
      giveProducts =  
    end
end
