class AddConnectionIdToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :connection_id, :integer
  end
end
