class Like < ApplicationRecord
  belongs_to :shop
  belongs_to :item

  validates_uniqueness_of :item_id, scope: :shop_id

end
