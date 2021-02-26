## users テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| email                | string     | null: false                    |
| encrypted_password   | string     | null: false                    |
| first_name           | string     | null: false                    |
| last_name            | string     | null: false                    |
| first_name_kana      | string     | null: false                    |
| last_name_kana       | string     | null: false                    |
| birth                | date       | null: false                    |

### Association

- has_many :items
- belongs_to :shipping_address

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

## shipping_address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal           | integer    | null: false |
| country_id       | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| build            | string     | null: true  |
| phone_number     | string     | null: false |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- has_many :item
- belongs_to :user

## order テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user