## users テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| encrypted_password   | string     | null: false                    |
| first_name           | string     | null: false                    |
| last_name            | string     | null: false                    |
| first_name_kana      | string     | null: false                    |
| last_name_kana       | string     | null: false                    |
| birth                | date       | null: false                    |

### Association

- has_many :items
- belongs_to :order

##  items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| category_id  | integer    | null: false                    |
| price        | integer    | null: false                    |
| description  | text       | null: false                    |
| condition_id | integer    | null: false                    |
| burden_id    | integer    | null: false                    |
| country_id   | integer    | null: false                    |
| days_id      | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shipping_address

## shipping_addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal           | integer    | null: false |
| country_id       | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| build            | string     | null: true  |
| phone_number     | string     | null: false |
| order            | references | null: false, foreign_key: true |

### Association
- belongs_to :order

## order テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_address
- belongs_to :user
- belongs_to :item