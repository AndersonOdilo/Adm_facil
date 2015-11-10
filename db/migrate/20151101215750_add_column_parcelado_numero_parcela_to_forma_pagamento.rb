class AddColumnParceladoNumeroParcelaToFormaPagamento < ActiveRecord::Migration
  def change
    add_column :formas_pagamentos, :parcelado, :boolean
    add_column :formas_pagamentos, :numero_parcela, :integer
  end
end
