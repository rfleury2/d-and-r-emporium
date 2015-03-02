class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.belongs_to  :shopper
      t.boolean     :purchased

      t.timestamps
    end
  end
end
