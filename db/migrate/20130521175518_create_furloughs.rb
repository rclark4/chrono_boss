class CreateFurloughs < ActiveRecord::Migration
  def change
    create_table :furloughs do |t|
      t.float :duration
      t.date :date_from
      t.date :date_to
      t.string :description
      t.string :length_of_day
      t.text :note
      t.integer :employee_id

      t.timestamps
    end
  end
end
