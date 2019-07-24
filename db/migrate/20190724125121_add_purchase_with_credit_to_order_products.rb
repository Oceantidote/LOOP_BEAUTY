class AddPurchaseWithCreditToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :purchase_with_credit, :boolean, default: false
    add_column :basket_products, :purchase_with_credit, :boolean, default: false
  end
end
