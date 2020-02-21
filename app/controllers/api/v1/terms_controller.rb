class Api::V1::TermsController < ApplicationController
 
    
 
    private

    def term_params
        params.require(:term).permit(:offer_term_code, :sku, :effective_date, {price_dimensions: [:rate_code, :description, :begin_range, :end_range, :unit]}, :price_details => [])
    end    


end
