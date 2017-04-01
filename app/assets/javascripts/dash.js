~ async function ( CONFIG ) {
  'use strict'

  // asyncify shopify
  await new Promise((resolve) => ShopifyApp.ready(resolve))

  // init the app
  ShopifyApp.Bar.initialize(CONFIG)
}({
  title: document.getElementsByTagName('head')[0].innerText || 'Giveaways',
  buttons: {
    primary: {
      label: 'Create Giveaway',
      message: 'save',
      href: '/giveaways/new'
    }
  }
})