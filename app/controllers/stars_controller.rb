class StarsController < ApplicationController

  before_action(:require_authentication, only: %i[create])

  def create

    received_parameters = params[:review_service_category]
    
    received_parameters.each do |k, v|
      service_star = ServiceStar.find_by(id: k)
      user_star = UserStar.find_by(user_id: @current_user.id, service_category_id: k)

      if user_star.present?

        current_count_star = service_star.send(user_star.star)
        service_star.send((user_star.star + '='), current_count_star - 1)

        current_count_star = service_star.send(v)
        service_star.send((v + '='), current_count_star + 1)

        service_star.save

        user_star.update(service_category_id: k, star: v)

      else
        user_star = UserStar.new(user_id: @current_user.id, service_category_id: k, star: v)
        user_star.save

        current_count_star = service_star.send(v)
        service_star.send((v + '='), current_count_star + 1)
      
        service_star.save
      end

    end   

    flash[:message] = 'Вы оставили отзыв'

    redirect_to(root_path)
  end
end
