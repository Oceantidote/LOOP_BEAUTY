import $ from 'jquery'
import 'select2'

const initSelect2 = () => {
  $('#lookbook_product_ids').select2()
  $('#tutorial_product_ids').select2()
  $('#new_in_products').select2()
  $('#tutorial_user').select2()
  $('#showroom_product_product').select2()
}

export default initSelect2
