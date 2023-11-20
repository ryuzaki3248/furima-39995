# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| full width name     | string | null: false |
| full width name kana| string | null: false |
| birth date          | string | null: false |


### Association

- has_many :items
- has_many :buys


## items テーブル

| Column                        | Type    | Options     |
| ----------------------------- | ------- | ------------------------------ |
| image                         | text    | null: false, foreign_key: true |
| product name                  | string  | null: false, foreign_key: true |
| product description           | text    | null: false, foreign_key: true |
| category                      | string  | null: false, foreign_key: true |
| product condition             | string  | null: false, foreign_key: true |
| burden of shipping charges    | string  | null: false, foreign_key: true |
| region of origin              | string  | null: false, foreign_key: true |
| number of days until shipping | string  | null: false, foreign_key: true |
| selling price                 | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price  | integer    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :residence


## residences テーブル

| Column  | Type       | Options                                     |
| ------- | ---------- | ------------------------------------------- |
| post code            | string     | null: false, foreign_key: true |
| prefectures          | string     | null: false, foreign_key: true |
| municipalities       | string     | null: false, foreign_key: true |
| street address       | string     | null: false, foreign_key: true |
| building name        | string     |              foreign_key: true |
| telephone number     | string     | null: false, foreign_key: true |

### Association

- belongs_to :buy