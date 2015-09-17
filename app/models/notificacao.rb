class Notificacao < ActiveRecord::Base
  belongs_to :produto

  scope :nao_visualizado, -> {where(visualizado: false)}
end
