class ServiceCategory < ApplicationRecord
  after_create :create_stars

  belongs_to :service
  belongs_to :category
  has_many :user_star
  has_one :service_star

  private

  def create_stars
    self.service_star = ServiceStar.new 
  end

end
