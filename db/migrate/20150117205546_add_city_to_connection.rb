class AddCityToConnection < ActiveRecord::Migration
  def change
    add_column :connections, :city, :string
  end
end
