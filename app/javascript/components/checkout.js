
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
}

export default initCheckout
