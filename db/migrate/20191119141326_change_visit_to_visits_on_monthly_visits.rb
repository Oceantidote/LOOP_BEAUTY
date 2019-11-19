class ChangeVisitToVisitsOnMonthlyVisits < ActiveRecord::Migration[5.2]
  def change
    rename_column :monthly_visits, :visit, :visits
  end
end
