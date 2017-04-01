class GiveawaysController < ShopifyApp::AuthenticatedController
    def index
      store_id = ShopifyAPI::Shop.current.id
      @giveaways = Giveaway.find_by(store: store_id)

    
    def new
      @giveaway = Giveaway.new
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
