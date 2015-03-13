class CreateVendas < ActiveRecord::Migration
  def change
    create_table :vendas do |t|
      t.references :forma_pagamento, index: true

      t.timestamps
    end
  end
end
