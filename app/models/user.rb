class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :password,        presence: true, format: {with: /\A[a-z0-9]+\z/ }
  # 全角のひらがなor漢字を使用していないか検証
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/ } do
    validates :first_name
    validates :last_name
  end
  # 全角のカタカナを使用していないか検証
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birth,           presence: true

  has_many :items
  has_many :orders
end
