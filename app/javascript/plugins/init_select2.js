import $ from 'jquery'
import 'select2'

const initSelect2 = () => {
  $('#lookbook_product_ids').select2({
    placeholder: 'products'
  })
  $('#tutorial_product_ids').select2({
    placeholder: 'products'
  })
  $('#product_product_ids').select2({
    placeholder: 'products'
  })
  $('#new_in_products').select2({
    placeholder: 'products'
  })
  $('#tutorial_user').select2()
  $('#showroom_product_product').select2({
    placeholder: 'products'
  })
}

export default initSelect2
