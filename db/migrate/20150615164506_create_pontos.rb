class CreatePontos < ActiveRecord::Migration
  def change
    create_table :pontos do |t|
      t.date :data_entrada
      t.time :hora_entrada
      t.date :data_saida
      t.time :hora_saida
      t.references :funcionario, index: true

      t.timestamps
    end
  end
end
