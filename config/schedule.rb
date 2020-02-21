# Use this file to easily define all of your cron jobs.

# For Development mode Please uncomment below code
# set :environment, "development"
# set :output, ‘log/whenever.log’ 


every :day, at: '12:00am' do
    p "Cron Job Started"
    rake 'fetch_data:store_data_in_db'
    p "Cron Job Ended"
end


# Learn more: http://github.com/javan/whenever
