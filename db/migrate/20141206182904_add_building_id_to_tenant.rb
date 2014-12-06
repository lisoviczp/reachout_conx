class AddBuildingIdToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :building_id, :integer
  end
end
