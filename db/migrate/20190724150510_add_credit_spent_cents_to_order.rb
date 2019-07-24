class AddCreditSpentCentsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :credit_spent_cents, :integer, default: 0
  end
end
