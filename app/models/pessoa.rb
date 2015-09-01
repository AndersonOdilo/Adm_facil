class Pessoa < ActiveRecord::Base
    actable as: :estado
    has_many :fones, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :enderecos, dependent: :destroy
    accepts_nested_attributes_for :fones, allow_destroy: true
    accepts_nested_attributes_for :emails, allow_destroy: true
    accepts_nested_attributes_for :enderecos, allow_destroy: true

    before_save :remover_nulos

    def remover_nulos
        self.fones.select{|fone| fone.numero.blank?}.collect{|fone| fone.destroy}
        self.emails.select{|email| email.descricao.blank?}.collect{|email| email.destroy}
        self.enderecos.select{|endereco| endereco.blank?}.collect{|endereco| endereco.destroy}
    end

end
