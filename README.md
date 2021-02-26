## users テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| email                | string     | null: false                    |
| encrypted_password   | string     | null: false                    |
| '苗字_フリガナ'        | string     | null: false                    |
| '名前_フリガナ'        | string     | null: false                    |
| birth                | date       | null: false                    |
| purchase             | references | null: false, foreign_key: true |

### Association

- has_many :items
- belongs_to :purchase

##  items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| category     | string     | null: false                    |
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
