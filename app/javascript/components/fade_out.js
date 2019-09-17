
const initFadeOut = () => {
    const alert = document.querySelector('.alert')
    
    const fadeOut = (flash) => {
      setTimeout(function() {
        flash.classList.add('fadeOut')
        setTimeout(function() {
          flash.classList.add('hide-flash')
          }, 500
        )
        }, 3000
      )
    }
    
    if(alert) {
      fadeOut(alert)
    }
}

export default initFadeOut
