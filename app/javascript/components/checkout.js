const initCheckout = () => {
  const form = document.querySelector("#new_order")
  if (!form) return
  const deliveryOptions = document.querySelectorAll('.checkout-delivery-option')
  const deliveryCosts = document.querySelectorAll('.delivery-cost')
  const totalCosts = document.querySelectorAll('.total-cost')

  const setDeliveryOption = e => {
    document.querySelector('.checkout-checkbox-inner').classList.remove('checkout-checkbox-inner')
    e.currentTarget.querySelector('.checkout-checkbox').firstElementChild.classList.add('checkout-checkbox-inner')
    const { deliverycost, total, deliverytype } = e.currentTarget.dataset
    deliveryCosts.forEach(cost => cost.innerText = `£${Number(deliverycost) / 100}`)
    totalCosts.forEach(cost => cost.innerText = `£${Number(total) / 100}`)
    form.querySelector('#order_delivery_type').value = deliverytype
  }

  deliveryOptions.forEach(option => {
    option.addEventListener('click', setDeliveryOption)
  })

  // *************** Checkout Address Section ******************

  const addressBtn = document.getElementById('addressBtn')
  const deliveryBtn = document.getElementById('deliveryBtn')
  const billingBtn = document.getElementById('billingBtn')
  const paymentBtn = document.getElementById('paymentHidden')

  const newBillingInput = document.getElementById('newBillingInput')
  const newBilling = document.getElementById('newBillingAddress')
  const newDeliveryInput = document.getElementById('newDeliveryInput')
  // const newDelivery = document.getElementById('newDeliveryAddress')
  const deliveryButtons = document.getElementById('deliveryAddressButtons')
  const billingButtons = document.getElementById('billingAddressButtons')
  const closeDelivery = document.getElementById('closeDeliveryInput')
  const closeBilling = document.getElementById('closeBillingInput')
  const billingAddressShow = document.getElementById('billingAddressShow')
  const deliveryAddressShow = document.getElementById('deliveryAddressShow')

  const deliveryHolder = document.getElementById('deliveryHolder')
  const savedDeliveryAddresses = document.querySelectorAll('.delivery-address-selector')
  const billingHolder = document.getElementById('billingHolder')
  const savedBillingAddresses = document.querySelectorAll('.billing-address-selector')
  const useAsBilling = document.getElementById('address_use_as_billing')



  savedDeliveryAddresses.forEach(a => a.addEventListener('click', () => {
    deliveryHolder.value = a.id;
    deliveryAddressShow.innerHTML = `
                                      <p class="s-medium-text muli boldest tiny-margin-bottom">${a.dataset.user}</p>
                                      <p class="grey-font s-medium-text didot boldest no-margin">${a.dataset.address_line1}</p>
                                      <p class="grey-font s-medium-text didot boldest no-margin">${a.dataset.city}</p>
                                      <p class="grey-font s-medium-text didot boldest no-margin">${a.dataset.country}</p>
                                      <p class="grey-font s-medium-text didot boldest no-margin">${a.dataset.postcode}</p>
                                    `
                                    deliveryAddressShow.classList.remove('d-none')
                                    deliveryAddressShow.parentNode.querySelector('.delivery-default').classList.add('d-none')
  }))

  savedBillingAddresses.forEach(a => a.addEventListener('click', () => {
    billingHolder.value = a.id;
    billingAddressShow.innerHTML = `
                                      <p class="s-medium-text muli boldest tiny-margin-bottom">${a.dataset.user}</p>
                                      <p class="grey-font s-medium-text didot boldest no-margin">${a.dataset.address_line1}</p>
                                      <p class="grey-font s-medium-text didot boldest no-margin">${a.dataset.city}</p>
                                      <p class="grey-font s-medium-text didot boldest no-margin">${a.dataset.country}</p>
                                      <p class="grey-font s-medium-text didot boldest no-margin">${a.dataset.postcode}</p>
                                    `
    billingAddressShow.classList.remove('d-none')
    billingAddressShow.parentNode.querySelector('.billing-default').classList.add('d-none')
  }))

  if (addressBtn) {
    addressBtn.addEventListener('click', () => {
      deliveryBtn.click();
      if (useAsBilling.checked === false) {
        billingBtn.click();
      }
      addressBtn.classList.add('d-none')
      paymentBtn.classList.remove('d-none')
    })
  }

  // if (newDelivery) {
  //   newDelivery.addEventListener('click', () => {
  //     newDeliveryInput.classList.remove('d-none')
  //     deliveryButtons.classList.add('d-none')
  //   })
  // }

  // if (closeDelivery) {
  //   closeDelivery.addEventListener('click', () => {
  //     newDeliveryInput.classList.add('d-none')
  //     deliveryButtons.classList.remove('d-none')
  //   })
  // }

  // if (newBilling) {
  //   newBilling.addEventListener('click', () => {
  //     newBillingInput.classList.remove('d-none')
  //     billingButtons.classList.add('d-none')
  //   })
  // }

  // if (closeBilling) {
  //   closeBilling.addEventListener('click', () => {
  //     newBillingInput.classList.add('d-none')
  //     billingButtons.classList.remove('d-none')
  //   })
  // }
}

export default initCheckout
