class GiveawaysController < ShopifyApp::AuthenticatedController
    def new
      products = ShopifyAPI::Product.find(:all, params: { limit: 250 })
      @products = []
      products.each do |product|
        @products.push({id: product.id, handle: product.handle})
      end
      p @products
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
    end
end
