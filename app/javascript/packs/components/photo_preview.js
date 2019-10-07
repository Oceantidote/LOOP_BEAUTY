displayPreview = (input) => {
  videoPreview = document.querySelector('.video-preview')
  if (input.files && input.files[0]) {
    let previews = input.parentNode.parentNode.querySelectorAll('.photo-preview')
    Array.from(input.files).forEach(file => {
      let reader = new FileReader();
      reader.onload = (event) => {
        if (event.currentTarget.result.substring(0,10) === "data:image") {
          console.log("true")
          if (videoPreview) {
            videoPreview.remove();
          }
          if (previews.length > 1) {
              previews[previews.length - 1].insertAdjacentHTML('afterend', `<img height="100" class="photo-preview" data-name="shade-photos" alt="shade photo" src="${event.currentTarget.result}">`)
          } else {
            previews.forEach(preview => preview.src = event.currentTarget.result)
          }
        } else {
          console.log("false")
          preview.src = ''
          input.insertAdjacentHTML('afterend', `<div class="video-preview photo-preview" data-name="tutorial-video"><p class="boldest no-margin didot">${input.files[0].name}</p></div>`)
        }
      }
      reader.readAsDataURL(file)
    })
    previews.forEach(preview => preview.classList.remove('d-none'))
  }
}
