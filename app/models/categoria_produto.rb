class CategoriaProduto < ActiveRecord::Base
    has_many :produtos, dependent: :restrict_with_error

    validates_uniqueness_of :name, :descricao_sensitive => false
end
