class ChangeDecimalPrecisionToGeral < ActiveRecord::Migration
  def change
    change_column :pagamentos_vendas, :valor, :decimal, precision: 15, scale: 2
    change_column :despesas_pagamentos, :valor, :decimal, precision: 15, scale: 2
  end
end
