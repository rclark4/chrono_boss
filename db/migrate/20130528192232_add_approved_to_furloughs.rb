class AddApprovedToFurloughs < ActiveRecord::Migration
  def self.up
    add_column :furloughs, :approved, :boolean, :default => false
  end

  def self.down
    remove_column :furloughs, :approved
  end
end
