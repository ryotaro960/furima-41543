class CreateSendingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :sending_addresses do |t|
      t.references :trade_record, null: false, foreign_key: true
      t.string :post_code,        null: false
      t.integer :prefecture_id,   null: false
      t.string :sending_city,     null: false
      t.string :sending_banchi,   null: false
      t.string :sending_building
      t.string :sending_phone,    null: false
      t.timestamps
    end
  end
end
