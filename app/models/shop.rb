class Shop < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :items, through: :shops_items, dependent: :destroy
  has_many :shops_items
  has_many :likes, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end
end
