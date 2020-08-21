export const initProductCards = () => {
  document.querySelectorAll('.card').forEach((card) => {
    card.addEventListener('mouseenter', (e) => {
      e.currentTarget.querySelector('.button-overlay').style.opacity = 1
    })
    card.addEventListener('mouseleave', (e) => {
      e.currentTarget.querySelector('.button-overlay').style.opacity = 0
    })
  })
}
