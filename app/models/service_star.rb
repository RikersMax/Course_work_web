class ServiceStar < ApplicationRecord
  belongs_to :service_category
  
  after_update :rating_stars

  STAR_1 = 1
  STAR_2 = 2
  STAR_3 = 3
  STAR_4 = 4
  STAR_5 = 5


  private

  def rating_stars
    summ_stars = (
      (self.star_1 * STAR_1) +
      (self.star_2 * STAR_2) +
      (self.star_3 * STAR_3) +
      (self.star_4 * STAR_4) +
      (self.star_5 * STAR_5) 
    )

    summ_grade = (
      self.star_1 +
      self.star_2 +
      self.star_3 +
      self.star_4 +
      self.star_5 
    )

    avg_score_var = 0 

    if summ_stars != 0 && summ_grade != 0 then
      avg_score_var = summ_stars.to_f / summ_grade.to_f    
    end

    #self.avg_score.round(2)
    #self.update(avg_score: avg_score_var.round(2))
    self.update_columns(avg_score: avg_score_var.round(2))
  end

end
