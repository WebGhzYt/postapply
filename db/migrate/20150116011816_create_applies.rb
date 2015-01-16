class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
    add_index :applies, :user_id
    add_index :applies, :post_id
    add_index :applies, [:user_id, :post_id], unique: true
  end

end
