class RenamePercentInDiscount < ActiveRecord::Migration[7.0]
  def change
    rename_column :discounts, :discount_percent, :percent
    change_column :discounts, :code, :string
  end
end
