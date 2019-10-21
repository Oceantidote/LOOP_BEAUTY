import $ from 'jquery'

const initProductShadeCards = () => {
  const buttonHolder = $('.button-holder')
  const cards = $('.product-shade-card')
  const mainImage = $('.product-main-image')
    $(cards).click((e) => {
      $(cards).removeClass('product-shade-card-selected')
      e.currentTarget.classList.add('product-shade-card-selected')
      $('#basket_product_shade_id').val(e.currentTarget.dataset.shadeid)
      mainImage.empty()
      mainImage.append(`<img id="expandedImg" class="myImg magniflier" alt="main shade image" src=${e.currentTarget.dataset.main}>`)
      $('.product-carousel').empty()
      $('.product-carousel').append(`<div class="product-shade-image">
                                        <img onclick="myFunction(this);" class="item-image-thumbnail" src=${e.currentTarget.dataset.main}>
                                      </div>`)
      JSON.parse(e.currentTarget.dataset.urls).forEach(url => {
        $('.product-carousel').append(`<div class="product-shade-image">
                                        <img onclick="myFunction(this);" class="item-image-thumbnail" src=${url}>
                                      </div>`)
      })
      $('.product-shade-title').html(`<strong>${e.currentTarget.dataset.name}</strong>`)
      console.log(e.currentTarget.dataset.stock)
      if (e.currentTarget.dataset.stock == "0") {
        buttonHolder.html(`<input type="submit" name="commit" value="OUT OF STOCK" disabled="disabled" class="primary-button disabled-button" data-disable-with="OUT OF STOCK">`)
      } else {
        buttonHolder.html(`<input type="submit" name="commit" value="ADD TO BAG" id="add-to-bag" class="primary-button" data-disable-with="ADD TO BAG">`)
      }
    })
}

export default initProductShadeCards
