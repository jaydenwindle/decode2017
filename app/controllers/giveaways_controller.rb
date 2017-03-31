class GiveawaysController < ShopifyApp::AuthenticatedController
    def index
        store_id = ShopifyApi::Store.current.id
        @giveaways = Giveaway.find_by(store: store_id)
    end

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
    end
end
