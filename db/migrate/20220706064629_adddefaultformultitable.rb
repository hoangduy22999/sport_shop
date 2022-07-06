class Adddefaultformultitable < ActiveRecord::Migration[7.0]
  def change
    change_column :shopping_sessions, :total, :decimal, default: 0
    change_column :orders, :total, :decimal, default: 0
    change_column :discounts, :active, :boolean, default: true
  end
end
