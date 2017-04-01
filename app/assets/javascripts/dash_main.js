~ async function ( CONFIG ) {
  'use strict'

  // special button cases
  if ( document.getElementById('dash-main-script').getAttribute('data-embed') ) {
    delete CONFIG.buttons
  }

  // asyncify shopify
  await new Promise((resolve) => ShopifyApp.ready(resolve))

  // init the app
  ShopifyApp.Bar.initialize(CONFIG)
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
