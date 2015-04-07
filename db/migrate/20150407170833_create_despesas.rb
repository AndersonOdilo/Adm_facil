class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.string :descricao
      t.references :tipo_despesa, index: true
      t.references :forma_pagamento, index: true

      t.timestamps
    end
  end
end
