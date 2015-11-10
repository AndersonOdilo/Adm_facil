class Email < ActiveRecord::Base
  belongs_to :pessoa
  RailsAdmin.config {|c| c.label_methods << :descricao}
end
