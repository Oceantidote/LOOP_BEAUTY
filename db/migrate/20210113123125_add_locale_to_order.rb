class AddLocaleToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :locale, :string, default: 'UK'
  end
end
