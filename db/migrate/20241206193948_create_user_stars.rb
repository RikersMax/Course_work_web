class CreateUserStars < ActiveRecord::Migration[7.1]
  def change
    create_table :user_stars do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service_category, null: false, foreign_key: true
      t.integer :star
      t.index [:user_id, :service_category_id], unique: true

      t.timestamps
    end


  end
end
