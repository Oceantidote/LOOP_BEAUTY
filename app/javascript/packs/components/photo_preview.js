displayPreview = (input) => {
  videoPreview = document.querySelector('.video-preview')
  if (input.files && input.files[0]) {
    let preview = input.parentNode.parentNode.querySelector('.photo-preview')
    console.log(preview.dataset)
    Array.from(input.files).forEach(file => {
      let reader = new FileReader();
      reader.onload = (event) => {
        if (event.currentTarget.result.substring(0,10) === "data:image") {
          if (videoPreview) {
            videoPreview.remove();
          }
          if (preview.dataset.name === 'shade-photos') {
            preview.insertAdjacentHTML('afterend', `<img height="100" class="photo-preview" data-name="shade-photos" alt="shade photo" src="${event.currentTarget.result}">`)
          } else {
            preview.src = event.currentTarget.result
          }
        } else {
          console.log("false")
          preview.src = ''
          input.insertAdjacentHTML('afterend', `<div class="video-preview photo-preview" data-name="tutorial-video"><p class="boldest no-margin didot">${input.files[0].name}</p></div>`)
          preview.classList.remove('d-none')
        }
      }
      reader.readAsDataURL(file)
    })
  }
}
