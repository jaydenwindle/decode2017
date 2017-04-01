require 'json'

class GiveawaysController < ShopifyApp::AuthenticatedController
    def index
      store_id = ShopifyAPI::Shop.current.id
      @giveaways = Giveaway.where(store: store_id)

      # get current giveaways
      @giveaways = Giveaway.where(
        store: store_id,
        isActive: true
      )

      # get metadata
      @prettyStart = Hash.new
      @nApplicants = Hash.new
      @nPrizes = Hash.new

      @giveaways.each do |giveaway|
        @prettyStart[giveaway.id] = giveaway.created_at.strftime('%b %d (%Y)')
        @nApplicants[giveaway.id] = giveaway.users.length
        @nPrizes[giveaway.id] = giveaway.products.length
      end

      # figure out our "main" giveaway
      @mainGiveaway = @giveaways[0]
      if @giveaways.length > 1
        @giveaways.each do |giveaway|
          if @nApplicants[giveaway.id] > @nApplicants[@mainGiveaway.id]
            @mainGiveaway = giveaway
          end
        end
      end

      # get past GiveawaysController
      @pastGiveaways = Giveaway.where(
        store: store_id,
        isActive: false
      )
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
      giveawayDescription = params[:description]
      giveawayName = params[:name]

      product_list= JSON.parse(params[:products])

      giveaway = Giveaway.new(
        :store => ShopifyAPI::Shop.current.id,
        :description => giveawayDescription,
        :name =>  giveawayName,
        :isActive => true
      )

      product_list.each do |p, q|
          product_info = ShopifyAPI::Product.find(p)
          giveaway.products << Product.new(prod_id: p, quantity: q, name: product_info.title, image_url: product_info.title || "/assets/images/placeholder.jpg")
      end

      if giveaway.save
        flash[:notice] = "Successfully created giveaway"
        redirect_to root_path
      else
        flash[:notice] = "Creating giveaway failed"
      end
    end

    def end_giveaway
      giveaway = Giveaway.find(params[:id])
      winners = giveaway.choose_winners
      if giveaway.update(:isActive => true)
        flash[:notice] = "Successfully endded giveaway"
        redirect_to root_path
      else
        flash[:notice] = "Endding giveaway failed"
      end
      winners
    end
end
