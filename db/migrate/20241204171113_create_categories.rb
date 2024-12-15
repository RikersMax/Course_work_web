class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :url_img

      t.timestamps
    end
  end
end
