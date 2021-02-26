## users テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| email      | string     | null: false                    |
| password   | string     | null: false                    |
| first_name | string     | null: false                    |
| last_name  | string     | null: false                    |
| birth      | datetime   | null: false                    |
| purchase   | references | null: false, foreign_key: true |

### Association

- has_many :items
- belongs_to :purchase

##  items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| category    | string     | null: false                    |
| price       | integer    | null: false                    |
| description | text       | null: false                    |
| condition   | text       | null: false                    |
| burden      | string     | null: false                    |
| country     | string     | null: false                    |
| days        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

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
