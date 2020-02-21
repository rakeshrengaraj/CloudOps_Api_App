namespace :fetch_data do

  
  desc "Fetching the data from API and storing in the db"
  task store_data_in_db: :environment do

    require 'net/http'
    
    url = 'http://localhost:3000/index.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    res = JSON.parse(response)

    p "Starting Rake Task Starting Rake Task Starting Rake Task Starting Rake Task"

    res["products"].map { |productkey, productvalue| productvalue }.each do |ptd_ele|
        product = Product.find_or_initialize_by(:sku => ptd_ele["sku"])
        product[:product_family] = ptd_ele["productFamily"]
        product[:sku] = ptd_ele["sku"]
        product[:product_attributes][:servicecode] = ptd_ele["attributes"]["servicecode"]
        product[:product_attributes][:location] = ptd_ele["attributes"]["location"]
        product[:product_attributes][:locationType] = ptd_ele["attributes"]["locationType"]
        product[:product_attributes][:group] = ptd_ele["attributes"]["group"]
        product[:product_attributes][:groupDescription] = ptd_ele["attributes"]["groupDescription"]
        product[:product_attributes][:usagetype] = ptd_ele["attributes"]["usagetype"]
        product[:product_attributes][:operation] = ptd_ele["attributes"]["operation"]
        product[:product_attributes][:servicename] = ptd_ele["attributes"]["servicename"]
        product[:product_attributes][:transferType] = ptd_ele["attributes"]["transferType"]
        product[:product_attributes][:fromLocation] = ptd_ele["attributes"]["fromLocation"]
        product[:product_attributes][:fromLocationType] = ptd_ele["attributes"]["fromLocationType"]
        product[:product_attributes][:toLocation] = ptd_ele["attributes"]["toLocation"]
        product[:product_attributes][:toLocationType] = ptd_ele["attributes"]["toLocationType"]
        
        if product.save
            @return_prod_val={
                :status=> 200,
                :message=> "Successfully Created Products"
            }
        else
            @return_prod_val={
                :status=> 500,
                :message=> "Sorry Products can't be created"
            }
        end    
            
    end    

    res["terms"]["OnDemand"].map { |k, v| v.map { | ke, va| va }}.each do |ele|
        ele.each do |el|
            term = Term.find_or_initialize_by(:sku => el["sku"])
            term[:offer_term_code] = el["offerTermCode"]
            term[:sku] = el["sku"]
            term[:effective_date] = el["effectiveDate"]
            el["priceDimensions"].map{|key, value| value }.each do |price_ele| 
                term[:price_dimensions][:rateCode] =  price_ele["rateCode"]
                term[:price_dimensions][:description] =  price_ele["description"]
                term[:price_dimensions][:beginRange] =  price_ele["beginRange"]
                term[:price_dimensions][:endRange] =  price_ele["endRange"]
                term[:price_dimensions][:unit] =  price_ele["unit"]
                term[:price_dimensions][:usd] =  price_ele["pricePerUnit"]["USD"]
                term[:price_details] <<  {:effectiveDate => el["effectiveDate"], :price_per_unit => price_ele["pricePerUnit"]["USD"]}
            end    
            if term.save
                @return_term_val={
                    :status=> 200,
                    :message=> "Successfully Created Terms"
                }
            else
                @return_term_val={
                    :status=> 500,
                    :message=> "Sorry Terms can't be created"
                }
            end   
        end    
    end      
    
    render :json => {:term_status => @return_term_val, :product_status => @return_prod_val}

    p "Ending Rake Task Ending Rake Task Ending Rake Task Ending Rake Task"

    end

end
