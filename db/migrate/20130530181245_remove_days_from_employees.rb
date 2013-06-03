class RemoveDaysFromEmployees < ActiveRecord::Migration
  def up
    remove_column :employees, :sick_days
    remove_column :employees, :vacation_days
    remove_column :employees, :sick_days_used
    remove_column :employees, :vacation_days_used
    remove_column :employees, :remaining_sick_days
    remove_column :employees, :remaining_vacation_days
  end

  def down
    add_column :employees, :remaining_vacation_days, :float
    add_column :employees, :remaining_sick_days, :float
    add_column :employees, :vacation_days_used, :float
    add_column :employees, :sick_days_used, :float
    add_column :employees, :vacation_days, :float
    add_column :employees, :sick_days, :float
  end
end
