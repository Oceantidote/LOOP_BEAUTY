priceContainer = document.querySelector('.shopping-bag-continue-checkout-total')
priceContainer.innerHTML = "<%= j render 'shopping-bag-price', basket: @basket %>"
