class Pais < ActiveRecord::Base
  has_many :estados, dependent: :restrict_with_error
  RailsAdmin.config {|c| c.label_methods << :nome}
end
