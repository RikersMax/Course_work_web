class ServiceCategory < ApplicationRecord
  belongs_to :service
  belongs_to :category
  has_many :user_star
  has_one :service_star
end
