class GiveawaysController < ShopifyApp::AuthenticatedController
    def index
      store_id = ShopifyAPI::Shop.current.id
      @giveaways = Giveaway.find_by(store: store_id)
    end

    def new
      @giveaway = Giveaway.new
      byebug
    end

    def edit
    end

    def show
    end

    def update
      # basically pseudo code someone who knows RoR plz help
      Giveaway.destroy(store: ShopifyAPI::Shop.current.id, name: params.name)
    end

    def destroy
    end

    def create
      giveawayProducts = ""
      giveawayDisciption = ""
      giveawayName = ""
      giveaway = Giveaway.new(
        :store => ShopifyAPI::Shop.current.id,
        :products => giveawayProducts,
        :discription => giveawayDisciption,
        :name =>  giveawayName
      )
      if giveaway.save
        flash[:notice] = "Successfully created giveaway"
      else
        flash[:notice] = "Creating giveaway failed"
      end
    end
end
