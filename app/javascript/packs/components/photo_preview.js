displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    document.querySelectorAll('.photo-preview').forEach((preview) => {
      if (input.dataset.name === preview.dataset.name) {
        reader.onload = (event) => {
          if (event.currentTarget.result.substring(0,10) === "data:image") {
            console.log("true")
            preview.src = event.currentTarget.result;
          } else {
            console.log("false")
            input.insertAdjacentHTML('afterend', `<div class="video-preview"><p class="boldest no-margin didot">${input.files[0].name}</p></div>`)
          }
        }
        reader.readAsDataURL(input.files[0])
        preview.classList.remove('d-none');
      }
    })
  }
}
