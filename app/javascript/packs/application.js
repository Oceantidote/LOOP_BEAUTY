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
import 'slick-carousel';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
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

// // ========================
// //  Slick
// // ========================

const carousel = document.querySelector('.home-featured-container');

$(document).ready(function(){
  $('.homepage-slick').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 1,
    speed: 1000,
    nextArrow: `<img src=${carousel.dataset.next} class="slick-next" style="width: 40px !important; height: 40px !important; z-index: 10" alt="next arrow">`,
    prevArrow: `<img src=${carousel.dataset.prev} class="slick-prev" style="width: 40px !important; height: 40px !important; z-index: 10" alt="next arrow">`,
    autoplay: true,
    autoplaySpeed: 5000,
    responsive: [
      {
        breakpoint: 992,
        settings: {
          slidesToShow: 2
        }
      },
      {
        breakpoint: 576,
        settings: {
          slidesToShow: 1
        }
      }
    ]
  });
});

