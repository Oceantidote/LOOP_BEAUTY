class AddVisitsAndPublishDateToLookbooks < ActiveRecord::Migration[5.2]
  def change
    add_column :lookbooks, :publish_date, :datetime
    add_column :lookbooks, :visits, :integer, default: 0
  end
end
