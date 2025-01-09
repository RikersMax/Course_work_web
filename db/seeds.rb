require 'json'

# Чтение содержимого файла
file_content = File.read('./db/seeds/seed_services.json')

# Парсинг JSON строки в хеш
data_hash = JSON.parse(file_content)

# Преобразование ключей в символы
data_hash.symbolize_keys!

#puts data_hash[:services].["service_#{1}"]['name']





data_hash[:services].count.times do |i|
  Service.create({
    name: data_hash[:services]["service_#{i+1}"]['name'],
    description: data_hash[:services]["service_#{i+1}"]['description'],
    url_img: data_hash[:services]["service_#{i+1}"]['url_img'],
    url_addres: data_hash[:services]["service_#{i+1}"]['url_addres']
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

ids_category = Category.ids

Service.count.times do |i|
  s_c = ServiceCategory.new
  s_c.service_id = i+1
  s_c.category_id = ids_category.sample
  ids_category.delete(s_c.category_id)
  s_c.save
end

puts('create ServiceCategory')
