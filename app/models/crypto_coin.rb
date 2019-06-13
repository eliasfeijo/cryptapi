class CryptoCoin < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
end
