class RecordMonthlyVisitsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Lookbook.find_each(&:record_current_visits)
    Tutorial.find_each(&:record_current_visits)
  end
end
