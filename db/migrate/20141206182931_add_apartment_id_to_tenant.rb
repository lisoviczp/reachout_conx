class AddApartmentIdToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :apartment_id, :integer
  end
end
