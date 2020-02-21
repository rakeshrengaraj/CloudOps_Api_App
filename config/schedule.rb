# Use this file to easily define all of your cron jobs.

# For Development mode Please uncomment below code
# set :environment, "development"
# set :output, ‘log/whenever.log’ 


every :day, at: '12:00 am' do
    p "Cron Job Started"
    runner 'Product.fetch_data(false)'
    p "Cron Job Ended"
end


# Learn more: http://github.com/javan/whenever
