Rails.application.routes.draw do
    resources :giveaways
  	get '/giveaways/:id/enter' => 'entries#enter'
  	post '/giveaways/:id/enter' => 'entries#new', as: :enter_giveaway
  	get '/giveaways/:id/confirmation' => 'entries#confirm', as: :enter_confirm
    get '/giveaways/:id/end_giveaway' => 'giveaways#end_giveaway', as: :end_giveaway
    get '/giveaways/:id/stats' => 'giveaways#stats', as: :stats_route

    root :to => 'giveaways#index'
    mount ShopifyApp::Engine, at: '/'

  namespace :app_proxy do
    
    scope ":id" do
      get 'enter'
      get 'confirmation'
    end

    root action: 'index'
    # simple routes without a specified controller will go to AppProxyController
    
    # more complex routes will go to controllers in the AppProxy namespace
    # 	resources :reviews
    # GET /app_proxy/reviews will now be routed to
    # AppProxy::ReviewsController#index, for example
  end
end
