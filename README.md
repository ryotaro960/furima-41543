## Users

|Column          |Type   |Options    |
|----------------|-------|-----------|
|nickname        |string |null: false|
|email           |text   |null: false, unique: true|
|password        |string |null: false|
|family_name_full|string |null: false|
|first_name_full |string |null: false|
|family_name_kana|string |null: false|
|first_name_kana |string |null: false|
|birth_year      |integer|null: false|
|birth_month     |integer|null: false|
|birth_day       |integer|null: false|


### Association
- has_many :items
- has_many :trade_records
- has_many :comments
- has_many :favorites


## Items

|Column           |Type   |Options    |
|-----------------|-------|-----------|
|user_id          |integer|foreign_key: true|
|item_image       |text   |null: false|
|item_name        |string |null: false|
|explanation      |text   |null: false|
|category         |string |null: false|
|status           |string |null: false|
|payer            |string |null: false|
|seller_prefecture|string |null: false|
|waiting          |string |null: false|


### Association
- belongs_to :user
- has_one :trade_record
- has_many :comments
- has_many :favorites


## Trade_records

|Column |Type   |Options          |
|-------|-------|-----------------|
|item_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :sending_address


## Sending_address

|Column            |Type   |Options    |
|------------------|-------|-----------|
|post_code         |string |null: false|
|sending_prefecture|string |null: false|
|sending_city      |string |null: false|
|sending_banchi    |string |null: false|
|sending_building  |string |           |
|sending_phone     |integer|null: false|


### Association
- belongs_to :trade_record


## Comments

|Column |Type   |Options          |
|-------|-------|-----------------|
|user_id|integer|foreign_key: true|
|item_id|integer|foreign_key: true|
|content|text   |null: false      |


### Association
- belongs_to :user
- belongs_to :item


## Favorites

|Column  |Type   |Options          |
|--------|-------|-----------------|
|user_id |integer|foreign_key: true|
|item_id |integer|foreign_key: true|
|okiniiri|boolean|                 |


### Association
- belongs_to :user
- belongs_to :item
