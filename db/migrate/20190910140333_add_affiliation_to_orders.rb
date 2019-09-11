class AddAffiliationToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :affiliation, polymorphic: true, index: true
  end
end
