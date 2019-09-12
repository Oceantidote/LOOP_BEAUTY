displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    document.querySelectorAll('.photo-preview').forEach((preview) => {
      if (input.dataset.name === preview.dataset.name) {
        reader.onload = (event) => {
          if (event.currentTarget.result.substring(0,10) === "data:image") {
            console.log("true")
            if (document.querySelector('.video-preview')) {
              document.querySelector('.video-preview').innerHTML = "";
            }
            preview.src = event.currentTarget.result;
          } else {
            console.log("false")
            document.querySelector('.video-preview').remove()
            input.insertAdjacentHTML('afterend', `<div class="video-preview photo-preview" data-name="tutorial-video"><p class="boldest no-margin didot">${input.files[0].name}</p></div>`)
          }
        }
        reader.readAsDataURL(input.files[0])
        preview.classList.remove('d-none');
      }
    })
  }
}
