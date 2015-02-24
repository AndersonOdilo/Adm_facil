class CreateCategoriasProdutos < ActiveRecord::Migration
  def change
    create_table :categorias_produtos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
