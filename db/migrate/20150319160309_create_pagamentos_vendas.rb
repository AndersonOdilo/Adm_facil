class CreatePagamentosVendas < ActiveRecord::Migration
  def change
    create_table :pagamentos_vendas do |t|
      t.date :data_vencimento
      t.date :data_pagamento
      t.decimal :valor
      t.references :venda, index: true

      t.timestamps
    end
  end
end
