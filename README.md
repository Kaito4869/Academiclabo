# Academiclabo
このAcademiclaboは中学生・高校生を対象としたサービスで、ユーザー同士で分からない問題を教え合い、知識のさらに深めることができます。
<img width="1680" alt="スクリーンショット 2021-04-01 23 51 29" src="https://user-images.githubusercontent.com/78203230/113417969-827b6300-93ff-11eb-84ea-0a3902688eba.png">

## ペルソナ
中学生・高校生

## Academiclabo開発の経緯
現代の中学生・高校生は分からない問題に遭遇した際にInstagramやTwitterを用いて第三者に教えてもらおうとしますが、それらのSNSは娯楽を求めるサービスであり学習用として使う人はごく一部です。そんな時に学習用SNSがあればユーザーは学習目的で訪れている人ばかりなので分からない問題をすぐに解決でき、他のユーザーの投稿を見て知識を深めることができます。こういった経緯でAcademiclaboを開発しました。

## URL
https://academiclabo.herokuapp.com/
画面右上のボタンから新規登録・ログインができます。

## 使用技術
- Ruby
- Ruby on Rails
- JavaScript
- MySQL
- AWS(S3)

## 機能一覧
- ユーザー登録、ログイン機能
- 投稿機能
- コメント機能
- 検索機能
- フォロー機能
- いいね機能
- ランキング機能

## 搭載予定機能一覧
- お問い合わせ機能
- トレンド機能
- フォローしているユーザーの投稿のみトップページに表示する機能
- あなたへのおすすめ機能

## テスト
- RSpec(単体テスト(model))

## DB 設計

### usersテーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| grade_id           | integer             | null: false             |
| name               | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |

#### Association

- has_many :posts
- has_many :comments

### relationshipsテーブル

| Column              | Type                | Options                 |
|---------------------|---------------------|-------------------------|
| user_id             | references          | foreign_key: true       |
| follow_id           | references          | foreign_key: true       |

#### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'

### postsテーブル

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| text                                | text       | null: false       |
| user                                | references | foreign_key: true |

#### Association

- belongs_to :user
- has_many :comments
- has_many :post_tag_relations, dependent: :destroy
- has_many :tags, through: :post_tag_relations

### post_tag_relationsテーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| post_id     | references | foreign_key: true |
| tag_id      | references | foreign_key: true |

#### Association
- belongs_to :post
- belongs_to :tag

### tagsテーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| subject_id  | integer    | null: false       |

#### Association

- has_many :post_tag_relations
- has_many :posts, through: :post_tag_relations

### commentsテーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

#### Association

- belongs_to :post
- belongs_to :userw