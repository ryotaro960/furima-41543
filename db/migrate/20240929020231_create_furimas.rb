class CreateFurimas < ActiveRecord::Migration[7.0]
  def change
    create_table :furimas do |t|
      t.references :user, null: false, foreign_key: true
      t.string :item_name,      null: false
      t.text :explanation,      null: false
      t.integer :category_id,   null: false
      t.integer :status_id,     null: false
      t.integer :payer_id,      null: false
      t.integer :prefecture_id, null: false
      t.integer :waiting_id,    null: false
      t.integer :price,         null: false
      t.timestamps
    end
  end
end
