import "bootstrap";
import 'flatpickr/dist/flatpickr.min.css'
import 'flatpickr/dist/themes/dark.css'
import 'tablesorter/dist/css/theme.default.min.css'

import initProductShadeCards from "../components/product_shade_cards"
import initMobileFilters from "../components/mobile_filters"
import initCheckout from "../components/checkout"
import initFlatpickr from "../components/flatpickr"
import initTablesorter from "../components/tablesorter";

initProductShadeCards()
initMobileFilters()
initCheckout()
initFlatpickr()
initTablesorter()