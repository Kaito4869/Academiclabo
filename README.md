# Academiclabo
Academiclaboは現役の中学生・高校生の声を元にした学習用SNSです。分からない問題や・詳しく知りたいことを共有してユーザー同士で教え合うことを目的として作成しました。現代の中学生や高校生は自宅で勉強している際に分からない問題に遭遇すると集中力を欠いてしまいます。そこで分からない問題に遭遇したらAcademiclaboで質問して謎を解き、理解を深めることができます。

## URL
https://academiclabo.herokuapp.com/
画面右上のボタンから新規登録・ログインができます。

## 使用技術
- Ruby 2.6.5p114
- Ruby on Rails 6.0.3.5
- MySQL 5.6.50
- AWS(S3)

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 投稿機能
- コメント機能
- 検索機能

## 搭載予定機能一覧
- フォロー機能(Ajax)
- いいね機能(Ajax)
- トレンド機能
- ランキング機能
- あなたへのおすすめ機能

- iPhone,Android対応

## DB 設計

### users table

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

### posts table

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

### comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

#### Association

- belongs_to :post
- belongs_to :user

### tags table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| subject_id  | integer    | null: false       |

#### Association

- has_many :post_tag_relations
- has_many :posts, through: :post_tag_relations

## テスト
- RSpec(単体テスト(model))
