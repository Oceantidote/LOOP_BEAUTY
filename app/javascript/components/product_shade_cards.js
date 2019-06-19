import $ from 'jquery'

const initProductShadeCards = () => {
  const cards = $('.product-shade-card')
    $(cards).click((e) => {
      $(cards).removeClass('product-shade-card-selected')
      e.currentTarget.classList.add('product-shade-card-selected')
      $('#basket_product_shade_id').val(e.currentTarget.dataset.shadeid)
    })
}

export default initProductShadeCards