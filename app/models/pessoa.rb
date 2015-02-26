class Pessoa < ActiveRecord::Base
    actable as: :estado

    has_many :fones, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :enderecos, dependent: :destroy
    has_many :funcoes, dependent: :destroy

    accepts_nested_attributes_for :fones, :allow_destroy => true
    accepts_nested_attributes_for :emails, :allow_destroy => true
end
