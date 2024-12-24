class ServicesController < ApplicationController

  def index
    @services = Service.all
    #@hash_id = {}
    #@services.each {|service| @hash_id[service.id] = service.service_category_ids}
    #@services_categories = ServiceCategory.find_by(id: @hash_id[1])
  end

  def show_id_several
    #render(plain: params[:id].chars)
    @services_find_by_id_several = Service.find(params[:id].chars)
    render('services/show_services')
  end
  
  def show
    @service_find_by_id = Service.find(params[:id])
  end
end
