
const initCheckout = () => {
  const form = document.querySelector("#new_order")
  if (!form) return

  const { email, description, amount, currency } = form.dataset

  const handler = StripeCheckout.configure({
    key: process.env.STRIPE_PUBLISHABLE_KEY,
    email,
    description,
    amount: Number(amount),
    currency,
    token: (token) => {
      form.querySelector('#order_stripe_stripe_email').value = token.email
      form.querySelector('#order_stripe_stripe_token').value = token.id
      form.submit()
    }
  })

  form.addEventListener('submit', e => {
    e.preventDefault()
    handler.open()
  })
}

export default initCheckout
