class AddBodyToDetails < ActiveRecord::Migration
  def change
    add_column :details, :body, :text
  end
end
