class AddAttributesToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :apartment_id, :integer
    add_column :notices, :tenant_id, :integer
    add_column :notices, :landlord_id, :integer
  end
end
