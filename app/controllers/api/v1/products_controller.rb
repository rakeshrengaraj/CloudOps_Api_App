class Api::V1::ProductsController < ApplicationController


    def get_by_region
        productskus = Product.where("product_attributes -> 'location' ? '#{params[:region_name]}'").or(Product.where("product_attributes -> 'fromLocation' ? '#{params[:region_name]}'")).map(&:sku)
        terms = Term.where(:sku => productskus)
        resultarr = []

        terms.each do |val|
            result = {}
            result["description"] = val.price_dimensions["description"]
            result["beginRange"] = val.price_dimensions["beginRange"]
            result["endRange"] = val.price_dimensions["endRange"]
            result["unit"] = val.price_dimensions["unit"]
            result["pricePerUnit"] = val.price_dimensions["usd"]
            if params[:date]
                result["effectiveDate"] = val.effective_date
            end    
            resultarr << result
        end    

        render :json => resultarr
    end  
    
    private

    def product_params
        params.require(:product).permit(:product_family, {product_attributes: [:servicecode , :location , :locationType , :group, :groupDescription , :usagetype , :operation, :servicename, :transferType, :fromLocation, :fromLocationType, :toLocation, :toLocationType  ]})
    end    

end
