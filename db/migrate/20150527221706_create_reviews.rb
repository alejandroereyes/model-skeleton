class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :rating
      t.text :comment
    end
  end
end
