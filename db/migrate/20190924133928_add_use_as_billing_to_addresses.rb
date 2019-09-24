class AddUseAsBillingToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :use_as_billing, :boolean, default: true
  end
end
