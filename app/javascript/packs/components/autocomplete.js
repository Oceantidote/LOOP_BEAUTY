import $ from 'jquery';
$('#query').keyup(function() {
  let query = document.getElementById('query').value
  // console.log("Hi, I'm in autocomplete")
  // console.log(window.location.origin)
  $.ajax({
      url: "/search_products",
      type: "GET",
      data: { input : query }
  })
});

// search = document.getElementById('query');
// data = JSON.parse(document.getElementById('product_search').dataset.products)
// console.log(data.slice(0,5))
// if (search) {
//   search.addEventListener('keyup', (event, suggestions) => {
//     suggestions = document.getElementById('suggestions');
//     if (event.target.value.length !== 0) {
//         suggestions.classList.remove('d-none');
//         suggestions.innerHTML = "";
//         suggestions.classList.remove('d-none');
//         data.forEach((suggestion) => {
//           console.log(event.target.value)
//           console.log(suggestion['title'])
//           // console.log(suggestion['title'].includes(event.target.value))
//           if (suggestion['title'].toLowerCase().includes(event.target.value.toLowerCase())) {
//             suggestions.insertAdjacentHTML('beforeend', `
//               <a class="suggestion-link" href='/make-up/${suggestion["slug"]}'>
//                 <div class="autocomplete_suggestion">
//                   ${suggestion['title']}
//                 </div>
//               </a>
//             `);
//           }
//         });
//     } else {
//     suggestions.classList.add('d-none');
//     }
//   });
// }
