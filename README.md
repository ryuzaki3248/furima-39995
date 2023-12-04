# テーブル設計

## users テーブル

| Column                    | Type     | Options     |
| ------------------------- | -------- | ----------- |
| nickname                  | string   | null: false |
| email                     | string   | null: false, unique: true|
| encrypted_password        | string   | null: false |
| full_width_last_name      | string   | null: false |
| full_width_first_name     | string   | null: false |
| full_width_last_name_kana | string   | null: false |
| full_width_first_name_kana| string   | null: false |
| birth_date                | date     | null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column                           | Type    | Options                                          |
| -----------------------------    | ------- | ----------------------                  -------- |
| product_name                     | string  | null: false |
| product_description              | text    | null: false |
| category_id                      | integer | null: false |
| product_condition_id             | integer | null: false |
| burden_of_shipping_charges_id    | integer | null: false |
| prefecture_id                    | integer | null: false |
| number_of_days_until_shipping_id | integer | null: false |
| selling_price                    | integer | null: false |
| user                             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associatio

- belongs_to :item
- belongs_to :user
- has_one :residence


## residences テーブル

| Column               | Type       | Options                       |
| -------              | ---------- | ----------------------------- |
| post_code            | string     | null: false                   |
| prefecture_id        | integer    | null:false                   | 
| municipalities       | string     | null: false                   |
| street_address       | string     | null: false                   |
| building_name        | string     |                               |
| telephone_number     | string     | null: false                   |
| buy                  | references | null: false foreign_key: true |
<!-- ↑紐付いている購入履歴を保存する外部キーが必要,購入履歴テーブルの外部キーとしてカラムを追加 -->

### Association

- belongs_to :buy