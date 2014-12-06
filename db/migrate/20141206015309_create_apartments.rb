class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :apartment_number
      t.integer :number_of_tenants
      t.string :apartment_code

      t.timestamps
    end
  end
end
