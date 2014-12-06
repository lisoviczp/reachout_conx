class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :number_of_apartments
      t.string :building_code

      t.timestamps
    end
  end
end
