class Estoque < ActiveRecord::Base
  belongs_to :unidade
  has_one :produto, :dependent: :restrict_with_error
end
