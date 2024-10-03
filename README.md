## users

|Column            |Type   |Options    |
|------------------|-------|-----------|
|nickname          |string |null: false|
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false|
|family_name_full  |string |null: false|
|first_name_full   |string |null: false|
|family_name_kana  |string |null: false|
|first_name_kana   |string |null: false|
|birth_date        |date   |null: false|


### Association
- has_many :items
- has_many :trade_records


## furimas

|Column       |Type      |Options    |
|-------------|----------|-----------|
|user         |references|null: false, foreign_key: true|
|item_name    |string    |null: false|
|explanation  |text      |null: false|
|category_id  |integer   |null: false|
|status_id    |integer   |null: false|
|payer_id     |integer   |null: false|
|prefecture_id|integer   |null: false|
|waiting_id   |integer   |null: false|
|price        |integer   |null: false|


### Association
- belongs_to :user
- has_one :trade_record


extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :category
- belongs_to :status
- belongs_to :payer
- belongs_to :prefecture
- belongs_to :waiting


## trade_records

|Column|Type      |Options          |
|------|----------|-----------------|
|furima|references|null: false, foreign_key: true|
|user  |references|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :furima
- has_one :sending_address


## sending_addresses

|Column          |Type      |Options    |
|----------------|----------|-----------|
|trade_record    |references|null: false, foreign_key: true|
|post_code       |string    |null: false|
|prefecture_id   |integer   |null: false|
|sending_city    |string    |null: false|
|sending_banchi  |string    |null: false|
|sending_building|string    |           |
|sending_phone   |string    |null: false|


### Association
- belongs_to :trade_record
