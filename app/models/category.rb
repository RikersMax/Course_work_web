class Category < ApplicationRecord
  has_many :service_categories
  has_many :services, through: :service_categories


  def creat_link_of_id
    self.services.inject('') {|result, serv| result += serv.id.to_s}
  end
end
