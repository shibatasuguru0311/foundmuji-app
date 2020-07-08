# chat-space  DB設計
## shopsテーブル
| Column | Type | Options |
|:-------|-----:|:-------:|
| name | string | null: false , index: true , unique: true |
| number | integer | null: false |
| image | text | null: false |
### Association
- has_many :messages
- has_many :items, through: :shops_items
- has_many :shops_items

## messagesテーブル
| Column | Type | Options |
|:-------|-----:|:-------:|
| shop | references | null: false , foreign_key: true |
| item | references | null: false , foreign_key: true |
| content | text | |
### Association
- belongs_to :shops
- belongs_to :items

## itemsテーブル
| Column | Type | Options |
|:-------|-----:|:-------:|
| name | string | null: false |
| image | text | null: false |
### Association
- has_many :messages
- has_many :shops, through: :shops_items
- has_many :shops_items

## shops_itemsテーブル
| Column | Type | Options |
|:-------|-----:|:-------:|
| shop | references | null: false , foreign_key: true |
| item | references | null: false , foreign_key: true |
### Association

