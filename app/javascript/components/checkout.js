
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
}

export default initCheckout
