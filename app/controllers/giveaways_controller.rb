class GiveawaysController < ShopifyApp::AuthenticatedController
    def index
        store_id = ShopifyAPI::Shop.current.id
        puts store_id

        @new_giveaway = Giveaway.new
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
