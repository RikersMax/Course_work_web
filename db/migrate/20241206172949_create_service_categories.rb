class CreateServiceCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :service_categories do |t|
      t.references :service, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.index [:service_id, :category_id], unique: true      

      t.timestamps
    end
  end
end
