class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.string :offer_term_code
      t.string :sku
      t.string :effective_date
      t.jsonb :price_dimensions, default: { :rateCode=>'', :description=>'',:beginRange =>'', :endRange =>'', :unit =>'', :usd =>'' }
      t.jsonb :price_details, array:true, default: []

      t.timestamps
    end
  end
end
