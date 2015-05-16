class Funcionario < ActiveRecord::Base
    has_one :usuario, dependent: :destroy
    has_many :pedidos
    belongs_to :cargo
    belongs_to :pessoa

    validates_uniqueness_of :cod, allow_blank: true
    validates_uniqueness_of :carteira_trabalho

    accepts_nested_attributes_for :usuario, limit: 1
    accepts_nested_attributes_for :pessoa
end
