class Detail < ActiveHash::Base
  self.data = [
    { id: 1, name: 'カテゴリー' },
    { id: 2, name: '商品状態' },
    { id: 3, name: '発送料負担' },
    { id: 4, name: '発送元地域' },
    { id: 5, name: '発送日数' }
  ]

  include ActiveHash::Associations
  has_many :items
end
