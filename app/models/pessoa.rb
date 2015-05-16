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
        self.fones.each do |fone|
            if fone.numero == ""
                fone.destroy
            end
        end
         self.emails.each do |email|
            if email.descricao == ""
                email.destroy
            end
        end
         self.enderecos.each do |endereco|
            if endereco.logradouro == nil
                endereco.destroy
            end
        end

    end

end
