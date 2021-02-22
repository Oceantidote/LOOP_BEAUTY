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

      mainImage.append(`<div class="myImg" id="expandedImg" style="background-image: url(${e.currentTarget.dataset.main}); background-position: center; background-size: cover;">
        </div>`)
      // mainImage.append(`<img id="expandedImg" class="myImg" alt="main shade image" src=${e.currentTarget.dataset.main}>`)
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
        buttonHolder.html(`<input type="submit" name="commit" value="OUT OF STOCK" disabled="disabled" class="primary-button disabled-button w-100" data-disable-with="OUT OF STOCK">`)
      } else {
        buttonHolder.html(`<input type="submit" name="commit" value="ADD TO BAG" id="add-to-bag" class="primary-button w-100" data-disable-with="ADD TO BAG">`)
      }
      initProductImageZoom();
    })
}

var initProductImageZoom = () => {
  // Get the image with the `myImg` class
  var zoomBox = document.querySelector('.myImg');
  if (zoomBox) {
    // Extract the URL
    var imageCss = window.getComputedStyle(zoomBox, false),
      imageUrl = imageCss.backgroundImage.slice(4, -1).replace(/['"]/g, '');
    // Get the original source image
    var imageSrc = new Image();
    imageSrc.onload = function() {
      var imageWidth = imageSrc.naturalWidth,
          imageHeight = imageSrc.naturalHeight,
          ratio = imageHeight / imageWidth;
      // Adjust the box to fit the image and to adapt responsively
      var percentage = ratio * 100 + '%';
      zoomBox.style.paddingBottom = percentage;
      // Zoom and scan on mousemove
      zoomBox.onmousemove = function(e) {
        // Get the width of the thumbnail
        var boxWidth = zoomBox.clientWidth,
          // Get the cursor position, minus element offset
          x = e.pageX - this.offsetLeft,
          y = e.pageY - this.offsetTop,
          // Convert coordinates to % of elem. width & height
          xPercent = x / (boxWidth / 100) + '%',
          yPercent = y / (boxWidth * ratio / 100) + '%';
        // Update styles w/actual size
        Object.assign(zoomBox.style, {
          backgroundPosition: xPercent + ' ' + yPercent,
          backgroundSize: imageWidth + 'px'
        });
      };
      // Reset when mouse leaves
      zoomBox.onmouseleave = function(e) {
        Object.assign(zoomBox.style, {
          backgroundPosition: 'center',
          backgroundSize: 'cover'
        });
      };
    }
    imageSrc.src = imageUrl;
  }
}

initProductImageZoom();

export default initProductShadeCards
