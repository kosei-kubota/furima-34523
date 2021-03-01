class Item < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true
  validates :burden_id, presence: true
  validates :country_id, presence: true
  validates :user, presence: true

  belongs_to :user
  has_one :order
end
