class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :cod
      t.string :carteira_trabalho
      t.decimal :salario
      t.date :data_admissao

      t.timestamps
    end
  end
end
