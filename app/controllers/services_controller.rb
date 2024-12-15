class ServicesController < ApplicationController

  def index
    @services = Service.all
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
