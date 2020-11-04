# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birth_date_1i    | integer| null: false |
| birth_date_2i    | integer| null: false |
| birth_date_3i    | integer| null: false |

<!-- devise使用のため未記入 -->
| email            | string | null: false |
| password         | string | null: false |

### Association

- has_many :items
- has_many :cards


## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| info               | text       | null: false       |
| category           | string     | null: false       |
| item_status        | string     | null: false       |
| fee_status         | string     | null: false       |
| prefecture         | string     | null: false       |
| scheduled_delivery | string     | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

<!-- Active Storage使用のため未記入 -->
| image              |            | null: false       |

### Association

- belongs_to :user
- has_one    :card


## card テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :post

## posts テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| postal-code        | string     | null: false       |
| prefecture         | string     | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building           | string     |                   |
| phone_number       | string     | null: false       |
| card               | references | foreign_key: true |

### Association

- belongs_to :card
