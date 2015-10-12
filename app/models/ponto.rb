class Ponto < ActiveRecord::Base
  belongs_to :funcionario

  scope :do_mes, -> {where(created_at: Date.current.beginning_of_month..Date.current.end_of_month)}
  
end
