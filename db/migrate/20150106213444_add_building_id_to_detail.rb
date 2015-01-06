class AddBuildingIdToDetail < ActiveRecord::Migration
  def change
    add_column :details, :building_id, :integer
  end
end
