class RemovePhoneNumberFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :phone_number, :string
  end
end
