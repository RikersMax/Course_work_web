class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :url_img
      t.text :url_addres

      t.timestamps
    end
  end
end
