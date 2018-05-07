class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :main_phone_number
      t.string :line_name
      t.string :num_tower

      t.timestamps
    end
  end
end
