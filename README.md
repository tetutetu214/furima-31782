# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| last-name        | string | null: false |
| first-name       | string | null: false |
| last-name-kana   | string | null: false |
| first-name-kana  | string | null: false |
| birth-date-1i    | integer| null: false |
| birth-date-2i    | integer| null: false |
| birth-date-3i    | integer| null: false |

<!-- devise使用のため未記入 -->
| email            | string | null: false |
| password         | string | null: false |

### Association

- has_many :items
- has_many :comments


## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| info               | text       | null: false       |
| category           | string     | null: false       |
| item-status        | string     | null: false       |
| fee-status         | string     | null: false       |
| prefecture         | string     | null: false       |
| scheduled-delivery | string     | null: false       |
| price              | integer    | null: false       |
| user_id            | references | foreign_key: true |

<!-- Active Storage使用のため未記入 -->
| image              |            | null: false       |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :card


## card テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| number      | integer    | null: false       |
| exp-month   | integer    | null: false       |
| exp-year    | integer    | null: false       |
| cvc         | integer    | null: false       |
| item_id     | references | foreign_key: true |

### Association

- belongs_to :item
- has_one    :post

## posts テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| postal-code        | integer    | null: false       |
| prefecture         | string     | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building           | string     |                   |
| phone-number       | integer    | null: false       |
| card_id            | references | foreign_key: true |

### Association

- belongs_to :card


## commentsテーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |
### Association

- belongs_to :prototype
- belongs_to :user