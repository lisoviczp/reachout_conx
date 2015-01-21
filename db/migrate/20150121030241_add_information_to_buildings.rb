class AddInformationToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :information, :text
  end
end
