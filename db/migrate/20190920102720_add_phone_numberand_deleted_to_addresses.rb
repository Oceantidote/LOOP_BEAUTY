class AddPhoneNumberandDeletedToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :phone_number, :string
    add_column :addresses, :deleted, :boolean, default: false
  end
end
