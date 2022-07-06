class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.integer :amount
      t.string :provider
      t.integer :status

      t.timestamps
    end
  end
end
