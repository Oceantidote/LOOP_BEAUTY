import "bootstrap";
import 'flatpickr/dist/flatpickr.min.css';
import 'flatpickr/dist/themes/dark.css';
import 'tablesorter/dist/css/theme.default.min.css';

import initProductShadeCards from "../components/product_shade_cards";
import initMobileFilters from "../components/mobile_filters";
import initCheckout from "../components/checkout";
import initFlatpickr from "../components/flatpickr";
import initTablesorter from "../components/tablesorter";
import initStarRating from '../plugins/init_star_rating';

initProductShadeCards();
initMobileFilters();
initCheckout();
initFlatpickr();
initTablesorter();
initStarRating();

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

