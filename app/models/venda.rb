class Venda < ActiveRecord::Base
  acts_as :pedido
  belongs_to :forma_pagamento

  accepts_nested_attributes_for :pedido
end
