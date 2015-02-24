class Pessoa < ActiveRecord::Base
    has_many :fones
    has_many :emails
    has_many :enderecos
    has_many :funcoes
    actable as: :estado
end
