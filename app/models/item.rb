class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, :description, presence: true

  validates :category_id, :condition_id, :burden_id, :country_id, :day_id, numericality: { other_than: 1 }

  validates :price, presence: true, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :country
  belongs_to :day
end
