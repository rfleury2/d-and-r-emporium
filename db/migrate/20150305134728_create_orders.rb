class CreateOrders < ActiveRecord::Migration
  def change
    create_table  :orders do |t|
      t.integer     :total
      t.belongs_to  :cart
      t.belongs_to  :shopper

      t.timestamps
    end
  end
end
