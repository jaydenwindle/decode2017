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

  //// magic
  //var magic = function () {
    //$('[data-magic]').each(function (_, elm) {
      //$.get('/giveaways/' + $(elm).attr('data-magic') + '/stats', function (_, __, data) {
        //$(elm).text(data.responseText)
      //})
    //})

    //requestAnimationFrame(magic)
  //}

  //magic()
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
;
