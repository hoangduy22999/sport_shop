class RemoveDiscountReferencesFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :dicount, foreign_key: true
    add_reference :products, :discount, foreign_key: true
  end
end
