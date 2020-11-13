# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birth_date       | date   | null: false |

### Association

- has_many :items



## items テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| name                  | string     | null: false       |
| info                  | text       | null: false       |
| category_id           | integer    | null: false       |
| item_status_id        | integer    | null: false       |
| fee_status_id         | integer    | null: false       |
| prefecture_id         | integer    | null: false       |
| scheduled_delivery_id | integer    | null: false       |
| price                 | integer    | null: false       |
| user                  | references | foreign_key: true |

### Association

- belongs_to :user
- has_many   :posts

## orders テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| price              | integer    | null: false       |
| item               | references | foreign_key: true |

- belongs_to :item
  has_one:address

## addresses テーブル
| prefecture_id      | integer    | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building           | string     |                   |
| phone_number       | string     | null: false       |
| order               | references | foreign_key: true |

- belongs_to :order

