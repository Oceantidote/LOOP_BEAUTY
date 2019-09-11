import "bootstrap";
import initProductShadeCards from "../components/product_shade_cards"
import initMobileFilters from "../components/mobile_filters"
import initCheckout from "../components/checkout"

initProductShadeCards()
initMobileFilters()
initCheckout()

// const displayPreview = (input) => {
//   console.log(input.dataset.name)
//   if (input.files && input.files[0]) {
//     const reader = new FileReader();
//     document.querySelectorAll('.photo-preview').forEach((preview) => {
//       console.log(3)
//       console.log(input.dataset.name)
//       // console.log(input.dataset.name)
//       // console.log(preview.dataset.name)
//       // console.log('----------')
//       if (input.dataset.name === preview.dataset.name) {
//         reader.onload = (event) => {
//           preview.src = event.currentTarget.result;
//         }
//         reader.readAsDataURL(input.files[0])
//         preview.classList.remove('d-none');
//       }
//     })
//   }
// }
