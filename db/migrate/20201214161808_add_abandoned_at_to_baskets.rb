class AddAbandonedAtToBaskets < ActiveRecord::Migration[5.2]
  def change
    add_column :baskets, :abandoned_at, :datetime
  end
end
