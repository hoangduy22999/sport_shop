class AddCodeToDiscounts < ActiveRecord::Migration[7.0]
  def change
    add_column :discounts, :code, :decimal
  end
end
