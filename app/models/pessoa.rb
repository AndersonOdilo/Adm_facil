class Pessoa < ActiveRecord::Base
    has_many :fones
    has_many :emails
    has_many :enderecos
    has_many :funcoes
    actable as: :estado

    accepts_nested_attributes_for :fones
    accepts_nested_attributes_for :emails
    accepts_nested_attributes_for :enderecos
end
