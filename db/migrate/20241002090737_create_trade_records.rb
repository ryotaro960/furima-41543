class CreateTradeRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :trade_records do |t|
      t.references :furima, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
