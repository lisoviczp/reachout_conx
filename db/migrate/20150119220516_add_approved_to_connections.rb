class AddApprovedToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :approved, :boolean
  end
end
