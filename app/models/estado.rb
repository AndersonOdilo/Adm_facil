class Estado < ActiveRecord::Base
  belongs_to :pais
  has_many :cidades, dependent: :restrict_with_error

  RailsAdmin.config {|c| c.label_methods << :nome}
end
