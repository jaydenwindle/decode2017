Rails.application.routes.draw do
    resource :giveaways
  	get '/giveaways/:id/enter' => 'entries#enter'
  	post '/giveaways/:id/enter' => 'entries#new', as: :enter_giveaway
  	get '/giveaways/:id/confirmation' => 'entries#confirm', as: :enter_confirm
    get '/giveaways/:id/end_giveaway' => 'giveaways#end_giveaway', as: :end_giveaway


    root :to => 'giveaways#index'
    mount ShopifyApp::Engine, at: '/'

  	post '/users/create' => 'users#create'
end
