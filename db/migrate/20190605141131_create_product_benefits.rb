class CreateProductBenefits < ActiveRecord::Migration[5.2]
  def change
    create_table :product_benefits do |t|
      t.references :product, foreign_key: true
      t.references :benefit, foreign_key: true

      t.timestamps
    end
  end
end
