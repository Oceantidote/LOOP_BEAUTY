import $ from 'jquery'
global.$ = $

import 'bootstrap';
import 'chartkick'
import 'chart.js'
import 'flatpickr/dist/flatpickr.min.css';
import 'flatpickr/dist/themes/dark.css';
import 'tablesorter/dist/css/theme.default.min.css';
import 'select2/dist/css/select2.min.css'

import "./components/cookie_box";
import "./components/autocomplete";

import initProductShadeCards from "../components/product_shade_cards";
import initMobileFilters from "../components/mobile_filters";
import initCheckout from "../components/checkout";
import initFlatpickr from "../components/flatpickr";
import initTablesorter from "../components/tablesorter";
import initStarRating from '../plugins/init_star_rating';
import initFadeOut from "../components/fade_out";
import { initSweetalert } from '../plugins/init_sweetalert';
import initSelect2 from '../plugins/init_select2';
// import autocompleteSearch from "../components/autocomplete"

initProductShadeCards();
initMobileFilters();
initCheckout();
initFlatpickr();
initTablesorter();
initStarRating();
initFadeOut();
initSelect2()
// autocompleteSearch();


// ========================
//  Sweet Alert for Deleting Addresses
// ========================

// Delivery Adresses
initSweetalert('.sweet-alert-delivery-trigger', {
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  icon: 'warning',
}, (value) => {
  if (value) {
    const link = document.querySelector(`#delete-delivery-link${window.deliveryId}`);
    link.click();
  }
});

// Billing Adresses
initSweetalert('.sweet-alert-billing-trigger', {
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  icon: 'warning',
}, (value) => {
  if (value) {
    const link = document.querySelector(`#delete-billing-link${window.billingId}`);
    link.click();
  }
});
