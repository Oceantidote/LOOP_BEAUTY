import $ from 'jquery'

const initProductShadeCards = () => {
  const cards = $('.product-shade-card')
    $(cards).click((e) => {
      $(cards).removeClass('product-shade-card-selected')
      e.currentTarget.classList.add('product-shade-card-selected')
      $('#basket_product_shade_id').val(e.currentTarget.dataset.shadeid)
      $('.product-carousel').empty()
      JSON.parse(e.currentTarget.dataset.urls).forEach(url => {
        $('.product-carousel').append(`<div class="product-shade-image">\
                                        <img onclick="myFunction(this);" class="item-image-thumbnail" src=${url}>
                                      </div>`)
      })
    })
}

export default initProductShadeCards
