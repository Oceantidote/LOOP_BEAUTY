class AddVisitsAndPublishDateToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :publish_date, :datetime
    add_column :tutorials, :visits, :integer, default: 0
  end
end
