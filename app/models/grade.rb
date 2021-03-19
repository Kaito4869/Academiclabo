class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '中学1年生' },
    { id: 3, name: '中学2年生' },
    { id: 4, name: '中学3年生' },
    { id: 5, name: '高校1年生' },
    { id: 6, name: '高校2年生' },
    { id: 7, name: '高校3年生' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
end
