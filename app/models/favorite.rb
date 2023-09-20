class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates_uniqueness_of :item_id, scope: :user_id
end

# already_liked? メソッド内
def already_liked?(item)
  result = current_user.favorites.exists?(item_id: item.id)
  puts "User #{current_user.id} already liked item #{item.id}: #{result}"
  result
end
