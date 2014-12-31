class AddDetailIdToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :detail_id, :integer
  end
end
