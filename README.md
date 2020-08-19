
## 無印良品の店舗スタッフ限定、「無印良品スタッフ口コミアプリ」を作成しました。

経緯：  
前職は無印良品の店長として勤務をしていました。   
新人スタッフが入社すると、商品の種類が多すぎてお客様の質問に答えられない    
という声が必ず上がりました。  
私自身も12年勤務していましたが、化粧品の知識はなく使い心地などの質問をうけると戸惑うことが多々ありました。    
無印良品のスタッフは、店舗の商品を愛用していることが多いので  
店舗スタッフのみ閲覧投稿できる口コミアプリがあれば、商品の理解が進み不安が解消されるのではないかと考え、 
口コミアプリを作成しました。　　

苦労した点:  
初めての個人開発製作物ということで、全て手探りでした。  
①deviseGemを使用しましたが、デフォルトのuserテーブルではなく  
shopテーブルに名称を変更したところ、エラーが頻発し苦労しました。  
②マイグレーションの追加などにより、デプロイ時のエラーに悩まされました。  
③MVCの理解が浅かったこともあり、idの受け渡しに苦労しました。  

ネットで検索したり、teratailで質問することで、一人で開発することができ  
大きな自信となりました。




# **実装機能紹介**
---


### 商品の口コミチャット機能
<img width="1336" alt="f5b19f3fd7623c49fd795db8bbed5eb3" src="https://user-images.githubusercontent.com/67133171/90229365-c01c8300-de52-11ea-84fa-30199027b83e.png">

・非同期でメッセージを送信することができる  
・ j Query、HAML、SCSSを使用してのマークアップ  
・ メッセージは無印良品のタグを意識している。タグには３行の商品説明が書かれているので、  
それをイメージしたメッセージチャットを作成。


### 商品、新規作成、検索機能

・新発売された商品を新規作成し登録することができる  
・商品を検索し、商品口コミページへ飛ぶことができる 
<img width="1114" alt="78481e92387393962427c0ddadae49b0" src="https://user-images.githubusercontent.com/67133171/90229372-c1e64680-de52-11ea-9286-e0ac9f140dc1.png">

<img width="1299" alt="d433f8411666957faa24893b051e1e4c" src="https://user-images.githubusercontent.com/67133171/90209743-2095cb00-de27-11ea-9dfa-5c25bca47eb7.png">

### いいね機能

<img width="1213" alt="f89297dea495ae303f45251452112c8e" src="https://user-images.githubusercontent.com/67133171/90229357-be52bf80-de52-11ea-95fb-fca3936b2fef.png">

・非同期で、いいねボタンを追加  
・いいねが多い順番のランキングページを作成  
.自分が押している商品がランキングに上がるとより愛着が湧くのでないかと思い作成  

### ログイン機能
.devise Gemを使用しての実装




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
        * 16日間(7/5 ~ 7/20 )
    * 平均作業時間：
        * 11時間/1日

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

