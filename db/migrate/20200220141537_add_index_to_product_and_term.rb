class AddIndexToProductAndTerm < ActiveRecord::Migration[5.2]
  def change
    add_index :products, :sku
    add_index :terms, :sku
  end
end
