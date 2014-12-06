class AddLandlordIdToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :landlord_id, :integer
  end
end
