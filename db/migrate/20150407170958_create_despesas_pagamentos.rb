class CreateDespesasPagamentos < ActiveRecord::Migration
  def change
    create_table :despesas_pagamentos do |t|
      t.date :data_vencimento
      t.date :data_pagamento
      t.decimal :valor
      t.references :despesa, index: true

      t.timestamps
    end
  end
end
