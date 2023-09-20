class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  validates :Nickname, presence: true
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end
  has_many :comments, dependent: :destroy
  has_many :blogs
end
