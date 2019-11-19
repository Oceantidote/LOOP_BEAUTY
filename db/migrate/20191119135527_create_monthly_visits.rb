class CreateMonthlyVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :monthly_visits do |t|
      t.datetime :month
      t.integer :visit
      t.references :tracked, polymorphic: true, index: true

      t.timestamps
    end
  end
end
