class AddNicknameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Nickname, :string
  end
end
