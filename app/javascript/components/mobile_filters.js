import $ from 'jquery'

const initMobileFilters = () => {
  const filterSlider = $('.mobile-filters')
  const filters = $('.partial-filters')
  $(filterSlider).click(function() {
    $(filters).slideToggle();
  });
}

export default initMobileFilters
