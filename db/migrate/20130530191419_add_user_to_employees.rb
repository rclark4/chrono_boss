class AddUserToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :email, :string
    add_column :employees, :password_digest, :string
    add_column :employees, :admin, :boolean, :default => false
  end

  def self.down
  	add_column :employees, :email
    add_column :employees, :password_digest
    add_column :employees, :admin
  end
end