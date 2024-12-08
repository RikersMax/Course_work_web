class CreateServiceStars < ActiveRecord::Migration[7.1]
  def change
    create_table :service_stars do |t|
      t.references :service_category, null: false, foreign_key: true
      t.integer :star_1, default: 0
      t.integer :star_2, default: 0
      t.integer :star_3, default: 0
      t.integer :star_4, default: 0
      t.integer :star_5, default: 0
      t.integer :avg_score
      t.integer :count_stars
      t.index [:service_category_id], unique: true, name: 'add_my_constraint_unique_user_id'

      t.timestamps
    end

=begin
    #create test data
    ServiceCategory.all.each do |serv_cat|
      
      serv_star = ServiceStar.new
      serv_star.service_category = serv_cat
      serv_star.avg_score = 0
      serv_star.count_stars = 0
      serv_star.save

    end 
=end

  end
end
