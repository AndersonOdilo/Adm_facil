class Pessoa < ActiveRecord::Base
    has_many :fones, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :enderecos, dependent: :destroy
    has_many :funcoes, dependent: :destroy
    actable as: :estado

    accepts_nested_attributes_for :fones
    accepts_nested_attributes_for :emails
    accepts_nested_attributes_for :enderecos
end
