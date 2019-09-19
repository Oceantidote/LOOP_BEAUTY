// import 'js-autocomplete/auto-complete.css';
// import autocomplete from 'js-autocomplete';

// const autocompleteSearch = function() {
//   const products = JSON.parse(document.getElementById('search-data').dataset.products)
//   const searchInput = document.getElementById('query');

//   if (products && searchInput) {
//     new autocomplete({
//       selector: searchInput,
//       minChars: 1,
//       source: function(term, suggest){
//           term = term.toLowerCase();
//           const choices = products;
//           const matches = [];
//           for (let i = 0; i < choices.length; i++)
//             if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
//           suggest(matches);
//           // console.log(matches)
//       },
//     });
//   }
// };

// export default autocompleteSearch;
