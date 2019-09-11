displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    document.querySelectorAll('.photo-preview').forEach((preview) => {
      if (input.dataset.name === preview.dataset.name) {
        reader.onload = (event) => {
          preview.src = event.currentTarget.result;
        }
        reader.readAsDataURL(input.files[0])
        preview.classList.remove('d-none');
      }
    })
  }
}
