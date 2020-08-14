
## 無印良品の店舗間限定、口コミアプリケーションを作成しました。

経緯：  
前職は無印良品の店長として勤務をしていました。   
新人スタッフが入社すると、商品の種類が多すぎて、お客様の質問に答えられない    
という声が必ず上がりました。  
私自身も12年勤務していましたが、化粧品の知識はなく使い心地などを質問をうけると戸惑うことが多々ありました。    
無印良品のスタッフは、店舗の商品を愛用していることが多いので  
店舗スタッフのみ閲覧投稿できる口コミアプリがあれば、商品の理解が進み不安が解消されるのではないかと考え、
店舗スタッフのみ閲覧投稿できる口コミアプリがあれば、商品の理解が進み不安が解消されるのではないかと考え,  
口コミアプリを作成しました。　　


# **実装機能紹介**
---


### 商品出品機能


・複数の画像を同時に投稿することができる
・別のテーブル同士を紐付けてデータに保存することができる
・ j Query、HTML、SCSSを使用してのマークアップ
・バリデーション、テストの記述


### 出品商品の編集、削除機能

・商品情報を編集や削除することができる
・単体テストやエラーハンドリングの記述
・HTML、SCSSを使用したマークアップ

### 商品一覧機能

・新着順にトップページ、詳細ページに表示される
・売り切れた商品はSOLDOUTの表示となる


### マークアップ
・マイページ、カテゴリーページを除く全てのページのマークアップを実施


## 開発状況
---


- 開発環境
    * 開発言語：
        * Ruby/Ruby on Rails
    * 開発ツール：
        * Gthub/Heroku/Visual Studio Code
    * データベース：
        * MySQL
- 開発期間
    * 開発期間：
        * 28日間(7/21 ~ 8/14 )
    * 平均作業時間：
        * 10時間/1日

- 動作概要
    * 接続先情報
    * URL：
        * https://foundmuji-app.herokuapp.com/shops/sign_in
    * Email:
        * aaaaaaaa@gmail.com
    * Pass:
        * aaaaaaaa
        
        
      店舗スタッフのみ使用できるアプリを想定している為、ログイン機能をつけていません。  
      しかし、実際に使用していただきたい為、ログインページに新規登録のリンクを現在仮でつけています。  
      是非、アカウントを作成してみてください。
       




# found-mujiapp  DB設計
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

