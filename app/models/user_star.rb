class UserStar < ApplicationRecord
  belongs_to :user
  belongs_to :service_category  
end
