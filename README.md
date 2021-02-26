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
- has_many :purchases

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
- belongs_to :purchase

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| credit_card      | string     | null: false                    |
| address          | string     | null: false                    |
| phone_number     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
