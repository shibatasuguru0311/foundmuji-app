class Item < ApplicationRecord
  has_many :messages
  has_many :shops, through: :shops_items
  has_many :shops_items
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
