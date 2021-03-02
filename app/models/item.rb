class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, :price, :description, :user, :image, presence: true

  validates :category_id, :condition_id, :burden_id, :country_id, :day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :country
  belongs_to :day
end
