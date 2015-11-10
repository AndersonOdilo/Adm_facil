class Unidade < ActiveRecord::Base
	has_many :produtos, dependent: :restrict_with_error
  validates_uniqueness_of :descricao, :case_sensitive => false
  RailsAdmin.config {|c| c.label_methods << :descricao}
end
