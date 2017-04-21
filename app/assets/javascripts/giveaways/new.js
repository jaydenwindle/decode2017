~ function ( CONFIG ) {
  'use strict'

  // list of products
  var products = []

  // render view
  var renderIf = function () {
    $('.prizesView')['fade' + ( products.length === 0 ? 'Out' : 'In' )](500)

    var btnSubmit = $('[type="submit"], #btnRmProduct')

    if (products.length === 0 && !btnSubmit.is('[disabled]')) btnSubmit.attr('disabled', '')
    else if (products.length > 0 && btnSubmit.is('[disabled]')) btnSubmit.removeAttr('disabled')
  }

  var renderProducts = function () {
    products = products.filter(function (product) {
      return product.gaQuantity > 0
    })

    $('#prizes').html(products.map(function (product, index) {
      return (
        '<li class="list-group-item justify-content-between" id="pid-' + index + '">' +
          '<div class="imgish p-4" style="background-image: url(' + ((product.image || {}).src || '/assets/placeholder.jpg') + '); "></div>' +
          product.title +
          '<div class="justify-content-right">' +
            '<span class="badge badge-default color-grey clickable click-minus">–</span>' +
            '<span class="badge color-black quantity">' + product.gaQuantity + '</span>' +
            '<span class="badge badge-default color-grey clickable click-plus">+</span>' +
            '<span class="badge color-grey clickable click-rm ml-2">x</span>' +
          '</div>' +
        '</li>'
      )
    }).join(''))

    var data = {}

    products.forEach(function (product) {
      data[product.id] = product.gaQuantity
    })

    $('[name="products"]').val(JSON.stringify(data))

    $('.click-plus').on('click', function (evt) {
      evt.preventDefault()

      products[
        parseInt($(this).parents('.list-group-item').attr('id').substr(4), 10)
      ].gaQuantity += 1
      render()
    })

    $('.click-minus').on('click', function (evt) {
      evt.preventDefault()

      products[
        parseInt($(this).parents('.list-group-item').attr('id').substr(4), 10)
      ].gaQuantity -= 1
      render()
    })

    $('.click-rm').on('click', function (evt) {
      evt.preventDefault()

      var target = $(this).parents('.list-group-item').attr('id').substr(4)
      products = products.filter(function (_, index) {
        return String(index) !== target
      })

      render()
    })
  }

  var render = function () {
    requestAnimationFrame(function () {
      // render products view
      renderProducts()

      // render visibility of conditional view
      renderIf()
    })
  }

  // promisify product modal
  var getProduct = function (resolve) {
    ShopifyApp.Modal.productPicker({
      'selectMultiple': true
    }, function (success, data) {
      if (!success && (data && data.products && data.products.length === 0 || (typeof data === 'string' && data.indexOf('Modal closed') === 0))) {
        success = true
        data = { products: [] }
      }

      // crapsies with bad error handling
      // TODO: don't do this
      if (!success) {
        return alert(JSON.stringify(data, null, 2))
      }

      // if all is good, just append
      resolve(data.products.map(function (product) {
        product.gaQuantity = 1
        return product
      }))
    })
  }

  // asyncify shopify
  ShopifyApp.ready(function () {
    // init the app (if not embeded)
    if ( !document.getElementById('giveaways-new').getAttribute('data-embed') ) {
      ShopifyApp.Bar.initialize(CONFIG)
    }

    // add binding for product modal
    $('#btnAddProduct').on('click', function (evt) {
      evt.preventDefault()

      getProduct(function (prod) {
        products = products.concat(prod)
        render()
      })
    })

    // binding for quick removal
    $('#btnRmProduct').on('click', function (evt) {
      evt.preventDefault()

      var target = $('#prizes').val()
      products = products.filter(function (product) {
        return target.indexOf(String(product.id)) === -1
      })

      render()
    })
  })
}({
  title: document.title || 'Giveaways',
  buttons: {
    primary: {
      label: 'Nevermind (Go back)',
      href: '/'
    }
  }
})
