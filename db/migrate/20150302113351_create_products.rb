class CreateProducts < ActiveRecord::Migration
  def change
    create_table  :products do |t|
      t.string      :name
      t.integer     :price
      t.belongs_to  :category

      t.timestamps
    end
  end
end
