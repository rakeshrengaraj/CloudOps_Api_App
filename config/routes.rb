Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
        resources :products
        resources :terms
        # post "/fetch_data" => "products#fetch_data"
        get "/service/AmazonCloudFront/region/:region_name(/:date)" => "products#get_by_region"
    end  
  end  
end
