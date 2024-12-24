module ServicesHelper
  def for_render_card_categories(id_serv_categ)
    ServiceCategory.find(id_serv_categ)
  end

  def avg_star_server(service_category_arr)
    summ_avg_stars = 0
    
    service_star_objects = ServiceStar.where(service_category_id: service_category_arr )
    service_star_objects.each do |s_s_object|
      summ_avg_stars += s_s_object.avg_score
    end

    avg_stars = summ_avg_stars / service_category_arr.count
    return avg_stars
  end

end
