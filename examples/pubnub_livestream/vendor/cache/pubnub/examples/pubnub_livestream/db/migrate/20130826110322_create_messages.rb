class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :author
      t.text :message
      t.integer :timetoken

      t.timestamps
    end
  end
end
