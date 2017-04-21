// Only loaded on giveaways#index controller
~ function ( CONFIG ) {
  'use strict'

  // init the app
  ShopifyApp.ready(function () {
    ShopifyApp.Bar.initialize(CONFIG)
  })

}({
  title: document.title || 'Giveaways',
  buttons: {
    primary: {
      label: 'Create Giveaway',
      message: 'save',
      href: '/giveaways/new'
    }
  }
})
