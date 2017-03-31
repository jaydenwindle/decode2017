Rails.application.routes.draw do
    resource :giveaways

    root :to => 'home#index'
    mount ShopifyApp::Engine, at: '/'
  
    post '/users/create' => 'users#create'

end
