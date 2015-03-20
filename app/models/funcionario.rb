class Funcionario < ActiveRecord::Base
    acts_as :funcao, as: :papel
    has_one :usuario, dependent: :destroy
    belongs_to :cargo

    accepts_nested_attributes_for :usuario, limit: 1
end
