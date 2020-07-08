class Message < ApplicationRecord
end
class Message < ApplicationRecord
  belongs_to :item
  belongs_to :shop

  validates :content, presence: true
end
