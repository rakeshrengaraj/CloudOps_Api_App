class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_family
      t.string :sku
      t.jsonb :product_attributes, default: {:servicecode => "", :location => "", :locationType => "", :group=> "", :groupDescription => "", :usagetype => "", :operation=>"", :servicename=>"", :transferType=>"", :fromLocation => "", :fromLocationType => "", :toLocation => "", :toLocationType => ""}

      t.timestamps
    end
  end
end
