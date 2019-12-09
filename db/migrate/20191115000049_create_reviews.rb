class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.string :avatar
      t.string :name
      t.text :post
      t.belongs_to :rating, null: false, foreign_key: true

      t.timestamps
    end
  end
end
