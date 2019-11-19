desc 'Record Monthly Visits'
task record_monthly_visits: :environment do
    RecordMonthlyVisitsJob.perform_now
end
