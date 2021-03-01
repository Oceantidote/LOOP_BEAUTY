displayPreview = (input) => {
  insiderArticle = document.getElementById('insiderArticle')
  videoPreview = document.querySelector('.video-preview')
  if (input.files && input.files[0]) {
    let preview = input.parentNode.parentNode.querySelector('.photo-preview')
    console.log(preview)
    Array.from(input.files).forEach(file => {
      let reader = new FileReader();
      reader.onload = (event) => {
        if (event.currentTarget.result.substring(0,10) === "data:image") {
          if (insiderArticle) {
            if (videoPreview) {
              videoPreview.remove();
            }
          }
          if (preview.dataset.name === 'shade-photos') {
            preview.insertAdjacentHTML('afterend', `<img height="100" class="photo-preview" data-name="shade-photos" alt="shade photo" src="${event.currentTarget.result}">`)
          } else if(preview.dataset.name === 'new-shade-photos') {
            const photoFlex = document.getElementById('newShadePhotos')
            photoFlex.insertAdjacentHTML('afterbegin', `<img height="100" class="photo-preview" data-name="shade-photos" alt="shade photo" src="${event.currentTarget.result}">`)
            console.log(`<img height="100" class="photo-preview" data-name="shade-photos" alt="shade photo" src="${event.currentTarget.result}">`)
          } else {
            preview.src = event.currentTarget.result
            preview.classList.remove('d-none')
          }
        } else {
          console.log("false")
          if (preview) {
            preview.src = ''
          }
          input.insertAdjacentHTML('afterend', `<div class="video-preview" data-name="tutorial-video"><p class="boldest no-margin neue-machina">${input.files[0].name}</p></div>`)
          if (preview) {
            preview.classList.add('d-none')
          }
        }
      }
      reader.readAsDataURL(file)
    })
  }
}
