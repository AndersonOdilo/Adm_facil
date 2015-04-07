class CreateTiposDespesas < ActiveRecord::Migration
  def change
    create_table :tipos_despesas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
