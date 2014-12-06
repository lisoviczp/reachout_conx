class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :body
      t.boolean :received

      t.timestamps
    end
  end
end
