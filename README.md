## users

|Column            |Type   |Options    |
|------------------|-------|-----------|
|nickname          |string |null: false|
|email             |text   |null: false, unique: true|
|encrypted_password|string |null: false|
|family_name_full  |string |null: false|
|first_name_full   |string |null: false|
|family_name_kana  |string |null: false|
|first_name_kana   |string |null: false|
|birth_date        |date   |null: false|


### Association
- has_many :items, dependent: :destroy
- has_many :trade_records, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy


## items

|Column       |Type      |Options    |
|-------------|----------|-----------|
|user         |references|foreign_key: true|
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
- has_one :trade_record, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy

extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :category
- belongs_to :status
- belongs_to :payer
- belongs_to :prefecture
- belongs_to :waiting


## trade_records

|Column|Type      |Options          |
|------|----------|-----------------|
|item  |references|foreign_key: true|
|user  |references|foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :sending_address, dependent: :destroy


## sending_addresses

|Column          |Type      |Options    |
|----------------|----------|-----------|
|trade_record    |references|foreign_key: true|
|post_code       |string    |null: false|
|prefecture_id   |integer   |null: false|
|sending_city    |string    |null: false|
|sending_banchi  |string    |null: false|
|sending_building|string    |           |
|sending_phone   |string    |null: false|


### Association
- belongs_to :trade_record

extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture


## comments

|Column |Type      |Options          |
|-------|----------|-----------------|
|user   |references|foreign_key: true|
|item   |references|foreign_key: true|
|content|text      |null: false      |


### Association
- belongs_to :user
- belongs_to :item


## favorites

|Column  |Type      |Options          |
|--------|----------|-----------------|
|user    |references|foreign_key: true|
|item    |references|foreign_key: true|
|okiniiri|boolean   |                 |


### Association
- belongs_to :user
- belongs_to :item
