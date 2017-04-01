~ function ( CONFIG ) {
  'use strict'

  // special button cases
  if ( document.getElementById('dash-main-script').getAttribute('data-embed') === 'true' ) {
    delete CONFIG.buttons
  }

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
