class AddColumnCargaHorariaToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :carga_horaria, :float
  end
end
