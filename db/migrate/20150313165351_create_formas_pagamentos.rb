class CreateFormasPagamentos < ActiveRecord::Migration
  def change
    create_table :formas_pagamentos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
