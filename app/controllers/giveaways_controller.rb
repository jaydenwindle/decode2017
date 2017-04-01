class GiveawaysController < ShopifyApp::AuthenticatedController
    include GiveawaysHelper
    
    def index
        byebug
        store_id = ShopifyAPI::Shop.current.id
        puts store_id
        @giveaways = Giveaway.find_by(store: store_id)
        puts @giveaways
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
