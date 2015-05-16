class CreateItensOrcamentos < ActiveRecord::Migration
  def change
    create_table :itens_orcamentos do |t|
      t.integer :quantidade
      t.decimal :preco
      t.references :orcamento, index: true
      t.references :produto, index: true

      t.timestamps
    end
  end
end
