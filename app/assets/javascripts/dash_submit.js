~ async function ( CONFIG ) {
  'use strict'

  // list of products
  var products = []

  // render view
  var renderIf = () => {
    $('#prizesView')['fade' + ( products.length === 0 ? 'Out' : 'In' )](500)

    var btnSubmit = $('[type="submit"], #btnRmProduct')

    if (products.length === 0 && !btnSubmit.is('[disabled]')) btnSubmit.attr('disabled', '')
    else if (products.length > 0 && btnSubmit.is('[disabled]')) btnSubmit.removeAttr('disabled')
  }

  var renderProducts = () => {
    products = products.filter(product =>
      product.gaQuantity > 0
    )

    $('#prizes').html(products.map((product, index) => `
      <li class="list-group-item justify-content-between" id="pid-${ index }">
        ${ product.title }
        <div class="justify-content-right">
          <span class="badge badge-danger badge-pill clickable click-minus">-</span>
          <span class="badge badge-default badge-pill">${ product.gaQuantity }</span>
          <span class="badge badge-success badge-pill clickable click-plus">+</span>
        </div>
      </li>
    `).join(''))

    var data = {}

    products.forEach(product => {
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
  }

  var render = () => requestAnimationFrame(() => {
    // render products view
    renderProducts()

    // render visibility of conditional view
    renderIf()
  })

  // promisify product modal
  var getProduct = () => new Promise((resolve, reject) => ShopifyApp.Modal.productPicker({
    'selectMultiple': true
  }, (success, data) => {
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
    resolve(data.products.map(product => {
      product.gaQuantity = 1
      return product
    }))
  }))

  // asyncify shopify
  await new Promise((resolve) => ShopifyApp.ready(resolve))

  // init the app
  ShopifyApp.Bar.initialize(CONFIG)

  // add binding for product modal
  $('#btnAddProduct').on('click', async evt => {
    evt.preventDefault()

    products = products.concat(await getProduct())
    render()
  })

  // binding for quick removal
  $('#btnRmProduct').on('click', evt => {
    evt.preventDefault()

    var target = $('#prizes').val()
    products = products.filter(product =>
      target.indexOf(String(product.id)) === -1
    )

    render()
  })
}({
  title: document.getElementsByTagName('head')[0].innerText || 'Giveaways'
})