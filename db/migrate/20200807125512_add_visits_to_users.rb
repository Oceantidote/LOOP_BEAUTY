class AddVisitsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :visits, :integer, default: 0
    add_column :users, :publish_date, :datetime
  end
end
