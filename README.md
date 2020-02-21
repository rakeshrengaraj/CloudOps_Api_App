# CloudOps_Api_App

* Plese configure your Postgresql for the app by replacing the username and password in database.yml.

* Run the rails app and the json will be available on the url http://localhost:3000/index.json.

* Run 'rails runner Product.fetch_data' to seed the data, the datas are stored as it is.

* The data will be fetched every midnight from the json file stored in the public/index.json.

* Pricing details for a specific region is available on the url http://localhost:3000/api/v1/service/AmazonCloudFront/region.

* Example to view Pricing details along with date filter are as follows

    1) http://localhost:3000/api/v1/service/AmazonCloudFront/region/Asia Pacific => where 'Asia Pacific' is the region name.

    2) http://localhost:3000/api/v1/service/AmazonCloudFront/region/Asia Pacific/?date=2019-12-01T00:00:00Z => where '2019-12-01T00:00:00Z' is the date filter.

* Old Pricing Per Unit details along with the new one are stored in an array with the effective date in Term Table.

* To add pricing for more services use url http://localhost:3000/api/v1/post_data and data should be in the format as mentioned in the file http://localhost:3000/sample.json