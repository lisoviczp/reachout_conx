class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :apartment_id
      t.integer :landlord_id

      t.timestamps
    end
  end
end
