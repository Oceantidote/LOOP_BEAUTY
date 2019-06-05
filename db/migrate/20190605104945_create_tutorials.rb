class CreateTutorials < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorials do |t|
      t.references :user, foreign_key: true
      t.string :affiliate_link
      t.string :video
      t.string :approved

      t.timestamps
    end
  end
end
