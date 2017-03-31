class GiveawaysController < ShopifyApp::AuthenticatedController
    def index
        store_id = ShopifyAPI::Shop.current.id
        puts store_id
        @giveaways = Giveaway.find_by(store: store_id)
        puts @giveaways
    end

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
