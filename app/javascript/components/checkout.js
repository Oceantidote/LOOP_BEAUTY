
const initCheckout = () => {
  const form = document.querySelector("#new_order")
  if (!form) return
  const deliveryOptions = document.querySelectorAll('.checkout-delivery-option')
  const deliveryCosts = document.querySelectorAll('.delivery-cost')
  const totalCosts = document.querySelectorAll('.total-cost')
  const key = process.env.STRIPE_PUBLISHABLE_KEY
  const handleCheckout = token => {
    form.querySelector('#order_stripe_stripe_email').value = token.email
    form.querySelector('#order_stripe_stripe_token').value = token.id
    form.submit()
  }

  const { email, description, amount, currency } = form.dataset

  let handler = StripeCheckout.configure({
    key,
    email,
    description,
    amount: Number(amount),
    currency,
    token: handleCheckout
  })

  form.querySelector('.stripe-button').addEventListener('click', e => {
    e.preventDefault()
    handler.open()
  })

  window.addEventListener('popstate', function() {
    handler.close()
  });

  const setDeliveryOption = e => {
    document.querySelector('.checkout-checkbox-inner').classList.remove('checkout-checkbox-inner')
    e.currentTarget.querySelector('.checkout-checkbox').firstElementChild.classList.add('checkout-checkbox-inner')
    const { deliverycost, total, deliverytype } = e.currentTarget.dataset
    deliveryCosts.forEach(cost => cost.innerText = `£${Number(deliverycost) / 100}`)
    totalCosts.forEach(cost => cost.innerText = `£${Number(total) / 100}`)
    form.querySelector('#order_delivery_type').value = deliverytype
    handler = StripeCheckout.configure({
      key,
      email,
      description,
      currency,
      token: handleCheckout,
      amount: Number(total)
    })
  }

  deliveryOptions.forEach(option => {
    option.addEventListener('click', setDeliveryOption)
  })

  // *************** Checkout Address Section ******************

  const addressBtn = document.getElementById('addressBtn')
  const deliveryBtn = document.getElementById('deliveryBtn')
  const billingBtn = document.getElementById('billingBtn')

  const newBillingInput = document.getElementById('newBillingInput')
  const newBilling = document.getElementById('newBillingAddress')
  const newDeliveryInput = document.getElementById('newDeliveryInput')
  const newDelivery = document.getElementById('newDeliveryAddress')
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

  savedDeliveryAddresses.forEach(a => a.addEventListener('click', () => {
    deliveryHolder.value = a.id;
    deliveryAddressShow.innerHTML = a.dataset.street
    deliveryAddressShow.classList.remove('d-none')
  }))

  savedBillingAddresses.forEach(a => a.addEventListener('click', () => {
    billingHolder.value = a.id;
    billingAddressShow.innerHTML = a.dataset.street
    billingAddressShow.classList.remove('d-none')
  }))

  if (addressBtn) {
    addressBtn.addEventListener('click', (event) => {
      deliveryBtn.click();
      billingBtn.click();
    })
  }

  newDelivery.addEventListener('click', () => {
    newDeliveryInput.classList.remove('d-none')
    deliveryButtons.classList.add('d-none')
  })

  closeDelivery.addEventListener('click', () => {
    newDeliveryInput.classList.add('d-none')
    deliveryButtons.classList.remove('d-none')
  })

  newBilling.addEventListener('click', () => {
    newBillingInput.classList.remove('d-none')
    billingButtons.classList.add('d-none')
  })

  closeBilling.addEventListener('click', () => {
    newBillingInput.classList.add('d-none')
    billingButtons.classList.remove('d-none')
  })
}

export default initCheckout
