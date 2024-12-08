# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

3.times do |i|
  Service.create({
    name: "name #{i}",
    description: "desc #{i}",
    url_img: "test_url #{i}",
    url_addres: "test_addtes #{i}"
  })
end

puts('create Service')

3.times do |i|
  Category.create({name: "catgory #{i}"})
end

puts('create catgory')

5.times do |i|
  User.create({name: "user№#{i}", email: "email_us#{i}"})
end

puts('create users')

Service.last.categories << Category.last

puts('add catgory to Service')

#create test data
ServiceCategory.all.each do |serv_cat|
  
  serv_star = ServiceStar.new
  serv_star.service_category = serv_cat
  serv_star.avg_score = 0
  serv_star.count_stars = 0
  serv_star.save

end 
puts ('create service stars')

puts('data entered into the database')