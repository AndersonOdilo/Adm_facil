class Cargo < ActiveRecord::Base
  has_many :funcionarios, dependent: :restrict_with_error
  validates_uniqueness_of :descricao, case_sensitive: false, presence: { message: "Este cargo ja existe" }

  RailsAdmin.config {|c| c.label_methods << :descricao}
end
