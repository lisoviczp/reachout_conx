class AddLandlordIdToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :landlord_id, :integer
  end
end
