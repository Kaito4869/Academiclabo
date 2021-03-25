# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| grade_id           | integer             | null: false             |
| name               | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |

### Association

- has_many :posts
- has_many :comments

## posts table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| text                                | text       | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :post_tag_relations, dependent: :destroy
- has_many :tags, through: :post_tag_relations

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| post        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## tags table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| subject_id  | integer    | null: false       |

- has_many :post_tag_relations
- has_many :posts, through: :post_tag_relations
