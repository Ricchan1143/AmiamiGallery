class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :about
      t.string :material

      t.timestamps
    end
  end
end
