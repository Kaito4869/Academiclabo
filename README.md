# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| occupation         | string              | null: false             |
| name               | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |

### Association

* has_many :posts
* has_many :comments

## posts table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| text                                | text       | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user