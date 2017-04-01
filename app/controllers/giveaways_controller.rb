class GiveawaysController < ShopifyApp::AuthenticatedController
    def index
      store_id = ShopifyAPI::Shop.current.id
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
      # basically pseudo code someone who knows RoR plz help
      Giveaway.destroy(store: ShopifyAPI::Shop.current.id, name: params.name)
    end

    def destroy
    end

    def create
      # will change when aki completes his parsing func
      giveaway = Giveaway.new(params)
      giveaway.save
    end
end
