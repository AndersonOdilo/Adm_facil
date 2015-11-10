class Cidade < ActiveRecord::Base
  belongs_to :estado
  has_many :enderecos, dependent: :restrict_with_error

  RailsAdmin.config {|c| c.label_methods << :nome}
end
