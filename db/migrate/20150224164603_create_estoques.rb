class CreateEstoques < ActiveRecord::Migration
  def change
    create_table :estoques do |t|
      t.integer :quantidade
      t.integer :nivel_alerta
      t.references :unidade, index: true

      t.timestamps
    end
  end
end
