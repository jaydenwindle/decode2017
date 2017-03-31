Rails.application.routes.draw do

    resource :giveaways

    root :to => 'giveaways#index'
    mount ShopifyApp::Engine, at: '/'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
