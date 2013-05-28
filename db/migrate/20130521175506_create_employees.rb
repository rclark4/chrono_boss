class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :employee_id
      t.string :first_name
      t.string :last_name
      t.date :hire_date
      t.float :sick_days
      t.float :vacation_days
      t.float :sick_days_used
      t.float :vacation_days_used
      t.float :remaining_sick_days
      t.float :remaining_vacation_days
      t.integer :employee_id

      t.timestamps
    end
  end
end
