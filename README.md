# Academiclabo
Academiclaboは中学生・高校生をターゲットにした、学習用SNSです。分からない問題や・詳しく知りたいことを共有してユーザー同士で教え合うことを目的として作成しました。

## URL
https://academiclabo.herokuapp.com/
画面右上のボタンから新規登録・ログインができます。

## 使用技術
Ruby 2.6.5p114
Ruby on Rails 6.0.3.5
MySQL 5.6.50

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 投稿機能
- コメント機能
- 検索機能

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