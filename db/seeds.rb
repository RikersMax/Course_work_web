# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
=begin
6.times do |i|
  Service.create({
    name: "name #{i}",
    description: "desc #{i}",
    url_img: "img #{i} test",
    url_addres: "url #{i} tst"
  })
end

puts('create Service')


Category.create({name: "manik", url_img: 'card/manik.png'})
Category.create({name: "pedikur", url_img: 'card/pedikur.png'})
Category.create({name: "resnichiki", url_img: 'card/resnichiki.png'})
Category.create({name: "narashivanie_volos", url_img: 'card/narashivanie_volos.png'})
Category.create({name: "okrashivanie_volos", url_img: 'card/okrashivanie_volos.jpg'})
Category.create({name: "make_up", url_img: 'card/make_up.png'})


puts('create catgory')

2.times do |i|
  User.create({name: "user№#{i}", email: "email_us#{i}"})
end

puts('create users')


def create_relations
  i = 1
  Category.all.each do |cate|
    serv = Service.find(i) 
    serv << cate
    serv.save
    i += 1
  end
end

create_relations

puts('add category to Service')

#create test data
ServiceCategory.all.each do |serv_cat|
  
  serv_star = ServiceStar.new
  serv_star.service_category << serv_cat
  serv_star.save

end 
puts ('create service stars')

puts('data entered into the database')


ServiceCategory.all.each do |ser_cal|
  ser_cal.service_star = ServiceStar.new

end
=end