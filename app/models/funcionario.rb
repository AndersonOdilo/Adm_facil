class Funcionario < ActiveRecord::Base
    acts_as :funcao, as: :papel
    has_one :usuario, dependent: :destroy
    belongs_to :cargo

    validates_uniqueness_of :cod, :case_sensitive => false
    validates_uniqueness_of :carteira_trabalho, :case_sensitive => false

    accepts_nested_attributes_for :usuario, limit: 1
end
