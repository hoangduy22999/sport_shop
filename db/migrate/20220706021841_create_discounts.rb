class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.text :desc
      t.decimal :discount_percent
      t.boolean :active

      t.timestamps
    end
  end
end
