class Funcionario < ActiveRecord::Base
    acts_as :funcao, as: :papel
    has_one :usuario, dependent: :destroy
    has_many :pedidos
    belongs_to :cargo

    validates_uniqueness_of :cod, allow_blank: true
    validates_uniqueness_of :carteira_trabalho

    accepts_nested_attributes_for :usuario, limit: 1
    accepts_nested_attributes_for :funcao, limit: 1
end
