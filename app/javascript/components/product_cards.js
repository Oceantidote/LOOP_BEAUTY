export const initProductCards = () => {
  document.querySelectorAll('.card').forEach((card) => {
    card.addEventListener('mouseenter', (e) => {
      if (e.currentTarget.querySelector('.button-overlay')) {
        e.currentTarget.querySelector('.button-overlay').style.opacity = 1
      }
    })
    card.addEventListener('mouseleave', (e) => {
      if (e.currentTarget.querySelector('.button-overlay')) {
        e.currentTarget.querySelector('.button-overlay').style.opacity = 0
      }
    })
  })
}
